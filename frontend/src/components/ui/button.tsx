import * as React from "react"
import { Slot } from "@radix-ui/react-slot"
import { cva, type VariantProps } from "class-variance-authority"
import { cn } from "../../lib/utils"

const buttonVariants = cva(
  "inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-lg border text-sm font-medium tracking-[-.01em] transition-colors duration-200 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-foreground focus-visible:ring-offset-2 focus-visible:ring-offset-background disabled:pointer-events-none disabled:opacity-50",
  { variants: {
    variant: {
      default: "border-foreground bg-foreground text-background shadow-sm hover:bg-foreground/90",
      outline: "border-border bg-transparent text-foreground hover:border-foreground/40 hover:bg-muted/70",
      ghost: "border-transparent bg-transparent text-muted-foreground hover:bg-muted hover:text-foreground",
    },
    size: { default: "h-12 px-7", sm: "h-11 px-6", icon: "size-11 p-0" },
  }, defaultVariants: { variant: "default", size: "default" } }
)
export interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement>, VariantProps<typeof buttonVariants> { asChild?: boolean }
export const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(({ className, variant, size, asChild, ...props }, ref) => {
  const Comp = asChild ? Slot : "button"
  return <Comp className={cn(buttonVariants({ variant, size }), className)} ref={ref} {...props} />
})
Button.displayName = "Button"
