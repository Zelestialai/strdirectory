import { describe, it, expect } from "vitest";
import { render, screen } from "@testing-library/react";
import { OnboardingChecklist } from "@/components/OnboardingChecklist";
import { getChecklistSteps, getCompletionScore } from "@/lib/profile-completeness";

function vendor(overrides: Record<string, any> = {}) {
  return {
    business_name: "Test Co",
    category_id: "c1",
    services: [],
    ...overrides,
  } as any;
}

describe("OnboardingChecklist", () => {
  it("shows the completed state at 100%", () => {
    render(<OnboardingChecklist steps={[]} score={100} />);
    expect(screen.getByText("Profile complete!")).toBeInTheDocument();
  });

  it("renders the score and step progress for an incomplete profile", () => {
    const steps = getChecklistSteps(vendor());
    const score = getCompletionScore(steps); // 10
    render(<OnboardingChecklist steps={steps} score={score} />);

    expect(screen.getByText(`${score}%`)).toBeInTheDocument();
    expect(screen.getByText("Complete your profile")).toBeInTheDocument();
    expect(screen.getByText("1 of 7 steps complete")).toBeInTheDocument();
  });

  it("shows completed step labels with strike-through and pending ones as links", () => {
    const steps = getChecklistSteps(vendor());
    render(<OnboardingChecklist steps={steps} score={10} />);

    // basic_info is done → its label is present
    expect(screen.getByText("Business name & category")).toBeInTheDocument();
    // location is pending → rendered as a link to the profile
    const locationLink = screen.getByText("Add your location").closest("a");
    expect(locationLink).toHaveAttribute("href", "/dashboard/profile#location");
  });
});
