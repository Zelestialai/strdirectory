"use client";
import { createContext, useContext, useState, useCallback, ReactNode } from "react";

interface CompareVendor {
  id: string;
  slug: string;
  name: string;
  logo_url: string | null;
}

interface CompareContextValue {
  items: CompareVendor[];
  toggle: (v: CompareVendor) => void;
  has: (id: string) => boolean;
  clear: () => void;
  full: boolean;
}

const CompareContext = createContext<CompareContextValue>({
  items: [], toggle: () => {}, has: () => false, clear: () => {}, full: false,
});

export function CompareProvider({ children }: { children: ReactNode }) {
  const [items, setItems] = useState<CompareVendor[]>([]);

  const toggle = useCallback((v: CompareVendor) => {
    setItems(prev => {
      if (prev.find(p => p.id === v.id)) return prev.filter(p => p.id !== v.id);
      if (prev.length >= 3) return prev; // max 3
      return [...prev, v];
    });
  }, []);

  const has = useCallback((id: string) => items.some(i => i.id === id), [items]);
  const clear = useCallback(() => setItems([]), []);

  return (
    <CompareContext.Provider value={{ items, toggle, has, full: items.length >= 3, clear }}>
      {children}
    </CompareContext.Provider>
  );
}

export function useCompare() { return useContext(CompareContext); }
