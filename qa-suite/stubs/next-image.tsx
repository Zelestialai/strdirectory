import React from "react";
export default function Image({ src, alt, fill, ...props }: any) {
  return React.createElement("img", { src: typeof src === "string" ? src : "", alt: alt ?? "", ...props });
}
