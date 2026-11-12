import * as React from "react"
import { cn } from "../../lib/utils"
export const Input = React.forwardRef<HTMLInputElement, React.InputHTMLAttributes<HTMLInputElement>>(({ className, ...props }, ref) => (
  <input ref={ref} className={cn("flex h-12 w-full border-0 border-b border-border bg-transparent px-0 text-base outline-none transition-colors placeholder:text-muted-foreground focus:border-foreground", className)} {...props} />
))
Input.displayName = "Input"
