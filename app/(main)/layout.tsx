import { CompareProvider } from "@/components/CompareContext";
import { CompareBar } from "@/components/CompareBar";

export default function MainLayout({ children }: { children: React.ReactNode }) {
  return (
    <CompareProvider>
      {children}
      <CompareBar />
    </CompareProvider>
  );
}
