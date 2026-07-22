import { describe, it, expect, vi } from "vitest";
import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import { StarRating } from "@/components/StarRating";

describe("StarRating", () => {
  it("renders `max` stars (default 5)", () => {
    const { container } = render(<StarRating rating={3} />);
    // Each star is wrapped in a button
    expect(container.querySelectorAll("button")).toHaveLength(5);
  });

  it("respects a custom max", () => {
    const { container } = render(<StarRating rating={2} max={10} />);
    expect(container.querySelectorAll("button")).toHaveLength(10);
  });

  it("fills the rounded number of stars", () => {
    const { container } = render(<StarRating rating={3.4} />);
    // 3.4 rounds to 3 filled
    const filled = container.querySelectorAll("svg.fill-amber-400");
    expect(filled).toHaveLength(3);
  });

  it("rounds 3.6 up to 4 filled stars", () => {
    const { container } = render(<StarRating rating={3.6} />);
    expect(container.querySelectorAll("svg.fill-amber-400")).toHaveLength(4);
  });

  it("disables buttons when not interactive", () => {
    const { container } = render(<StarRating rating={3} />);
    container.querySelectorAll("button").forEach((btn) => {
      expect(btn).toBeDisabled();
    });
  });

  it("calls onRate with the 1-based star index when interactive", async () => {
    const onRate = vi.fn();
    const { container } = render(<StarRating rating={0} interactive onRate={onRate} />);
    const buttons = container.querySelectorAll("button");
    await userEvent.click(buttons[2]); // third star
    expect(onRate).toHaveBeenCalledWith(3);
  });

  it("does not call onRate when not interactive", async () => {
    const onRate = vi.fn();
    const { container } = render(<StarRating rating={0} onRate={onRate} />);
    await userEvent.click(container.querySelectorAll("button")[0]);
    expect(onRate).not.toHaveBeenCalled();
  });
});
