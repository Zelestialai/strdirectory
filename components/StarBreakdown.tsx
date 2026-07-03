import { Star } from "lucide-react";

interface Props {
  counts: Record<number, number>; // { 5: 12, 4: 5, 3: 2, 2: 1, 1: 0 }
  total: number;
  avg: number;
}

export function StarBreakdown({ counts, total, avg }: Props) {
  if (total === 0) return null;

  return (
    <div className="rounded-xl border bg-white p-5 mb-6">
      <div className="flex items-center gap-6">
        {/* Big avg score */}
        <div className="text-center shrink-0">
          <p className="text-5xl font-bold text-gray-900 leading-none">{avg.toFixed(1)}</p>
          <div className="flex items-center justify-center gap-0.5 mt-1.5">
            {[1, 2, 3, 4, 5].map((n) => (
              <Star
                key={n}
                className={`h-3.5 w-3.5 ${
                  n <= Math.round(avg)
                    ? "fill-amber-400 text-amber-400"
                    : "fill-gray-200 text-gray-200"
                }`}
              />
            ))}
          </div>
          <p className="text-xs text-gray-400 mt-1">{total} review{total !== 1 ? "s" : ""}</p>
        </div>

        {/* Bar breakdown */}
        <div className="flex-1 space-y-1.5">
          {[5, 4, 3, 2, 1].map((star) => {
            const count = counts[star] ?? 0;
            const pct = total > 0 ? (count / total) * 100 : 0;
            return (
              <div key={star} className="flex items-center gap-2 text-xs">
                <span className="w-3 text-right text-gray-500 shrink-0">{star}</span>
                <Star className="h-3 w-3 fill-amber-400 text-amber-400 shrink-0" />
                <div className="flex-1 h-2 bg-gray-100 rounded-full overflow-hidden">
                  <div
                    className="h-full bg-amber-400 rounded-full transition-all"
                    style={{ width: `${pct}%` }}
                  />
                </div>
                <span className="w-5 text-right text-gray-400 shrink-0">{count}</span>
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );
}
