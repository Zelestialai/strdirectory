"use client";

interface DataPoint {
  date: string;   // "YYYY-MM-DD"
  count: number;
}

interface Props {
  data: DataPoint[];
}

const DAYS_ABBR = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"];

export function ViewsChart({ data }: Props) {
  const max = Math.max(...data.map((d) => d.count), 1);

  // Show every 5th label to avoid crowding
  const labelStep = Math.ceil(data.length / 6);

  return (
    <div className="w-full">
      {/* Bars */}
      <div className="flex items-end gap-[2px] h-32">
        {data.map(({ date, count }, i) => {
          const heightPct = (count / max) * 100;
          const d = new Date(date + "T12:00:00");
          const isWeekend = d.getDay() === 0 || d.getDay() === 6;
          return (
            <div
              key={date}
              className="group relative flex-1 flex flex-col justify-end"
              title={`${date}: ${count} view${count !== 1 ? "s" : ""}`}
            >
              {/* Tooltip */}
              <div className="absolute bottom-full mb-1.5 left-1/2 -translate-x-1/2 pointer-events-none
                              opacity-0 group-hover:opacity-100 transition-opacity z-10
                              bg-gray-900 text-white text-xs rounded px-2 py-1 whitespace-nowrap">
                {count} view{count !== 1 ? "s" : ""}
                <div className="absolute top-full left-1/2 -translate-x-1/2 border-4 border-transparent border-t-gray-900" />
              </div>

              <div
                style={{ height: `${Math.max(heightPct, count > 0 ? 4 : 1)}%` }}
                className={`w-full rounded-t-sm transition-all ${
                  count === 0
                    ? "bg-gray-100"
                    : isWeekend
                    ? "bg-brand-300 group-hover:bg-brand-400"
                    : "bg-brand-500 group-hover:bg-brand-600"
                }`}
              />
            </div>
          );
        })}
      </div>

      {/* X-axis labels */}
      <div className="flex gap-[2px] mt-1.5">
        {data.map(({ date }, i) => {
          const d = new Date(date + "T12:00:00");
          const showLabel = i % labelStep === 0 || i === data.length - 1;
          return (
            <div key={date} className="flex-1 text-center">
              {showLabel && (
                <span className="text-[10px] text-gray-400">
                  {DAYS_ABBR[d.getDay()]}
                </span>
              )}
            </div>
          );
        })}
      </div>

      {/* Legend */}
      <div className="flex items-center gap-4 mt-3 pt-3 border-t border-gray-100">
        <div className="flex items-center gap-1.5">
          <div className="h-2.5 w-2.5 rounded-sm bg-brand-500" />
          <span className="text-xs text-gray-500">Weekday</span>
        </div>
        <div className="flex items-center gap-1.5">
          <div className="h-2.5 w-2.5 rounded-sm bg-brand-300" />
          <span className="text-xs text-gray-500">Weekend</span>
        </div>
        <div className="ml-auto text-xs text-gray-400">
          Peak: {max} view{max !== 1 ? "s" : ""}
        </div>
      </div>
    </div>
  );
}
