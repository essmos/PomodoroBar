import AppKit

let size: CGFloat = 1024
let image = NSImage(size: NSSize(width: size, height: size))
image.lockFocus()
guard let ctx = NSGraphicsContext.current?.cgContext else { fatalError("brak kontekstu") }

// tło: zaokrąglony biały kwadrat
let bgRect = CGRect(x: 48, y: 48, width: 928, height: 928)
let bgPath = CGPath(roundedRect: bgRect, cornerWidth: 210, cornerHeight: 210, transform: nil)
ctx.addPath(bgPath)
ctx.setFillColor(NSColor(calibratedRed: 0.96, green: 0.96, blue: 0.98, alpha: 1).cgColor)
ctx.fillPath()

// korpus pomidora
ctx.setFillColor(NSColor(calibratedRed: 0.92, green: 0.26, blue: 0.21, alpha: 1).cgColor)
ctx.fillEllipse(in: CGRect(x: 180, y: 250, width: 664, height: 590))

// refleks
ctx.setFillColor(NSColor(calibratedWhite: 1.0, alpha: 0.35).cgColor)
ctx.fillEllipse(in: CGRect(x: 330, y: 660, width: 200, height: 120))

// liście
ctx.setFillColor(NSColor(calibratedRed: 0.32, green: 0.63, blue: 0.28, alpha: 1).cgColor)
let leaf1 = CGMutablePath()
leaf1.move(to: CGPoint(x: 512, y: 838))
leaf1.addLine(to: CGPoint(x: 512, y: 700))
leaf1.addLine(to: CGPoint(x: 420, y: 830))
leaf1.closeSubpath()
ctx.addPath(leaf1)
ctx.fillPath()

let leaf2 = CGMutablePath()
leaf2.move(to: CGPoint(x: 512, y: 838))
leaf2.addLine(to: CGPoint(x: 512, y: 700))
leaf2.addLine(to: CGPoint(x: 604, y: 830))
leaf2.closeSubpath()
ctx.addPath(leaf2)
ctx.fillPath()

// łodyżka
ctx.setStrokeColor(NSColor(calibratedRed: 0.24, green: 0.5, blue: 0.22, alpha: 1).cgColor)
ctx.setLineWidth(34)
ctx.setLineCap(.round)
ctx.move(to: CGPoint(x: 512, y: 838))
ctx.addLine(to: CGPoint(x: 512, y: 918))
ctx.strokePath()

image.unlockFocus()

guard let tiff = image.tiffRepresentation,
      let rep = NSBitmapImageRep(data: tiff),
      let png = rep.representation(using: .png, properties: [:]) else {
    fatalError("nie udało się zapisać PNG")
}
try! png.write(to: URL(fileURLWithPath: "icon_1024.png"))
print("ikona: ok")
