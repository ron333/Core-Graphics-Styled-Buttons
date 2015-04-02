//
//  StyledButton.swift
//  ronButtonStates2
//
//  Created by Ronald on 4/2/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

  import UIKit
  
  class StyledButton: UIButton {
    
    var isPressed = true
    var isOn = true
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
      isPressed = true
      setNeedsDisplay()
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
      isPressed = false
      isOn = !isOn
      setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
      
      UIGraphicsBeginImageContextWithOptions (CGSize(width:210, height:40), false, 0.0)  // false - not opaque;  0.0 - no scaling
      let ctx = UIGraphicsGetCurrentContext()	// iOS
      
      let colorSpace = CGColorSpaceCreateDeviceRGB()
      
      let scaleFactor: CGFloat = 1;
      // CGContextScaleCTM(ctx, scaleFactor, scaleFactor);
      
      /*  Shape   */
      let pathRef = CGPathCreateMutable()
      CGPathMoveToPoint(pathRef, nil, 15, 0)
      CGPathAddLineToPoint(pathRef, nil, 195, 0)
      CGPathAddCurveToPoint(pathRef, nil, 203.284, 0, 210, 8.954, 210, 20)
      CGPathAddLineToPoint(pathRef, nil, 210, 20)
      CGPathAddCurveToPoint(pathRef, nil, 210, 31.046, 203.284, 40, 195, 40)
      CGPathAddLineToPoint(pathRef, nil, 15, 40)
      CGPathAddCurveToPoint(pathRef, nil, 6.716, 40, 0, 31.046, 0, 20)
      CGPathAddLineToPoint(pathRef, nil, 0, 20)
      CGPathAddCurveToPoint(pathRef, nil, 0, 8.954, 6.716, 0, 15, 0)
      CGPathCloseSubpath(pathRef)
      
      /*  Drop Shadow  */
      let shadowColorComps: [CGFloat] = [0, 0, 0, 0.35]
      let shadowColor = CGColorCreate(colorSpace, shadowColorComps)
      
      let shadowPath = CGPathCreateMutable()
      CGPathMoveToPoint(shadowPath, nil, -23, -1)
      CGPathAddCurveToPoint(shadowPath, nil, -14.091, -1, -7, 8.454, -7, 20)
      CGPathAddCurveToPoint(shadowPath, nil, -7, 31.546, -14.091, 41, -23, 41)
      CGPathAddLineToPoint(shadowPath, nil, -203, 41)
      CGPathAddCurveToPoint(shadowPath, nil, -211.909, 41, -219, 31.546, -219, 20)
      CGPathAddCurveToPoint(shadowPath, nil, -219, 8.454, -211.909, -1, -203, -1)
      CGPathAddLineToPoint(shadowPath, nil, -23, -1)
      CGPathCloseSubpath(shadowPath)
      
      let clipPath = CGPathCreateMutable()
      CGPathMoveToPoint(clipPath, nil, -4, -5)
      CGPathAddLineToPoint(clipPath, nil, 214, -5)
      CGPathAddLineToPoint(clipPath, nil, 214, 45)
      CGPathAddLineToPoint(clipPath, nil, -4, 45)
      CGPathCloseSubpath(clipPath)
      
      CGContextSaveGState(ctx)
      CGContextAddPath(ctx, clipPath)
      CGContextClip(ctx)
      
      CGContextTranslateCTM(ctx, 0, 1)
      CGContextSetShadowWithColor(ctx, CGSize(width: (218 * scaleFactor), height: 0), (2 * scaleFactor), shadowColor)
      CGContextSetRGBFillColor(ctx, 0, 0, 0, 1)
      CGContextAddPath(ctx, shadowPath)
      CGContextFillPath(ctx)
      
      CGContextRestoreGState(ctx)
      
      CGContextSetRGBFillColor(ctx, 1, 0.565, 0, 1)
      if(isOn) {
        CGContextSetRGBFillColor(ctx, 0, 0.565, 1, 1)
      }
      
      CGContextAddPath(ctx, pathRef)
      CGContextFillPath(ctx)
      
      /*  Gradient Fill  */
      CGContextSaveGState(ctx)
      CGContextAddPath(ctx, pathRef)
      CGContextClip(ctx)
      
      let gradientColors: [CGFloat] = [
        0, 0, 0, 0.2,
        1, 1, 1, 0.2]
      
      var gradientLocations: [CGFloat] = [0, 1]
      if (isOn) {
        gradientLocations[0] = 1
        gradientLocations[1] = 0
      }
      
      let gradientRef = CGGradientCreateWithColorComponents(colorSpace, gradientColors, gradientLocations, 2)
      CGContextDrawLinearGradient(ctx, gradientRef, CGPoint(x: 105, y: 40), CGPoint(x: 105, y: 0), CGGradientDrawingOptions(kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation))
      CGContextRestoreGState(ctx)
      
      /*  Stroke Path  */
      let strokePathRef = CGPathCreateMutable()
      CGPathMoveToPoint(strokePathRef, nil, 195, -1)
      CGPathAddCurveToPoint(strokePathRef, nil, 203.909, -1, 211, 8.454, 211, 20)
      CGPathAddCurveToPoint(strokePathRef, nil, 211, 31.546, 203.909, 41, 195, 41)
      CGPathAddLineToPoint(strokePathRef, nil, 15, 41)
      CGPathAddCurveToPoint(strokePathRef, nil, 6.091, 41, -1, 31.546, -1, 20)
      CGPathAddCurveToPoint(strokePathRef, nil, -1, 8.454, 6.091, -1, 15, -1)
      CGPathAddLineToPoint(strokePathRef, nil, 195, -1)
      CGPathCloseSubpath(strokePathRef)
      CGPathMoveToPoint(strokePathRef, nil, 195, 0)
      CGPathAddLineToPoint(strokePathRef, nil, 15, 0)
      CGPathAddCurveToPoint(strokePathRef, nil, 6.716, 0, 0, 8.954, 0, 20)
      CGPathAddCurveToPoint(strokePathRef, nil, 0, 31.046, 6.716, 40, 15, 40)
      CGPathAddLineToPoint(strokePathRef, nil, 195, 40)
      CGPathAddCurveToPoint(strokePathRef, nil, 203.284, 40, 210, 31.046, 210, 20)
      CGPathAddCurveToPoint(strokePathRef, nil, 210, 8.954, 203.284, 0, 195, 0)
      CGPathCloseSubpath(strokePathRef)
      
      CGContextSetRGBFillColor(ctx, 0, 0, 0, 0.5)
      CGContextAddPath(ctx, strokePathRef)
      CGContextFillPath(ctx)
      
      /*  Inner Shadow  */
      let shadowColorComps2: [CGFloat] = [1, 1, 1, 0.5]
      let shadowColor2 = CGColorCreate(colorSpace, shadowColorComps2)
      
      let shadowPath2 = CGPathCreateMutable()
      CGPathMoveToPoint(shadowPath2, nil, -216, -4)
      CGPathAddLineToPoint(shadowPath2, nil, -2, -4)
      CGPathAddLineToPoint(shadowPath2, nil, -2, 44)
      CGPathAddLineToPoint(shadowPath2, nil, -216, 44)
      CGPathCloseSubpath(shadowPath2)
      CGPathMoveToPoint(shadowPath2, nil, -19, -1)
      CGPathAddLineToPoint(shadowPath2, nil, -199, -1)
      CGPathAddCurveToPoint(shadowPath2, nil, -207.909, -1, -215, 8.454, -215, 20)
      CGPathAddCurveToPoint(shadowPath2, nil, -215, 31.546, -207.909, 41, -199, 41)
      CGPathAddLineToPoint(shadowPath2, nil, -19, 41)
      CGPathAddCurveToPoint(shadowPath2, nil, -10.091, 41, -3, 31.546, -3, 20)
      CGPathAddCurveToPoint(shadowPath2, nil, -3, 8.454, -10.091, -1, -19, -1)
      CGPathCloseSubpath(shadowPath2)
      
      let clipPath2 = CGPathCreateMutable()
      CGPathMoveToPoint(clipPath2, nil, 195, -1)
      CGPathAddCurveToPoint(clipPath2, nil, 203.909, -1, 211, 8.454, 211, 20)
      CGPathAddCurveToPoint(clipPath2, nil, 211, 31.546, 203.909, 41, 195, 41)
      CGPathAddLineToPoint(clipPath2, nil, 15, 41)
      CGPathAddCurveToPoint(clipPath2, nil, 6.091, 41, -1, 31.546, -1, 20)
      CGPathAddCurveToPoint(clipPath2, nil, -1, 8.454, 6.091, -1, 15, -1)
      CGPathAddLineToPoint(clipPath2, nil, 195, -1)
      CGPathCloseSubpath(clipPath2)
      
      CGContextSaveGState(ctx)
      CGContextAddPath(ctx, clipPath2)
      CGContextClip(ctx)
      
      CGContextTranslateCTM(ctx, 0, 2)
      CGContextSetShadowWithColor(ctx, CGSize(width: (214 * scaleFactor), height: 0), (0 * scaleFactor), shadowColor2)
      CGContextSetBlendMode(ctx, kCGBlendModeOverlay)
      CGContextSetRGBFillColor(ctx, 0, 0, 0, 1)
      CGContextAddPath(ctx, shadowPath2)
      CGContextFillPath(ctx)
      
      CGContextRestoreGState(ctx)
      
      /*  Inner Shadow  */
      let shadowColorComps3: [CGFloat] = [0, 0, 0, 0.15]
      let shadowColor3 = CGColorCreate(colorSpace, shadowColorComps3)
      
      let shadowPath3 = CGPathCreateMutable()
      CGPathMoveToPoint(shadowPath3, nil, -216, -4)
      CGPathAddLineToPoint(shadowPath3, nil, -2, -4)
      CGPathAddLineToPoint(shadowPath3, nil, -2, 44)
      CGPathAddLineToPoint(shadowPath3, nil, -216, 44)
      CGPathCloseSubpath(shadowPath3)
      CGPathMoveToPoint(shadowPath3, nil, -19, -1)
      CGPathAddLineToPoint(shadowPath3, nil, -199, -1)
      CGPathAddCurveToPoint(shadowPath3, nil, -207.909, -1, -215, 8.454, -215, 20)
      CGPathAddCurveToPoint(shadowPath3, nil, -215, 31.546, -207.909, 41, -199, 41)
      CGPathAddLineToPoint(shadowPath3, nil, -19, 41)
      CGPathAddCurveToPoint(shadowPath3, nil, -10.091, 41, -3, 31.546, -3, 20)
      CGPathAddCurveToPoint(shadowPath3, nil, -3, 8.454, -10.091, -1, -19, -1)
      CGPathCloseSubpath(shadowPath3)
      
      let clipPath3 = CGPathCreateMutable()
      CGPathMoveToPoint(clipPath3, nil, 195, -1)
      CGPathAddCurveToPoint(clipPath3, nil, 203.909, -1, 211, 8.454, 211, 20)
      CGPathAddCurveToPoint(clipPath3, nil, 211, 31.546, 203.909, 41, 195, 41)
      CGPathAddLineToPoint(clipPath3, nil, 15, 41)
      CGPathAddCurveToPoint(clipPath3, nil, 6.091, 41, -1, 31.546, -1, 20)
      CGPathAddCurveToPoint(clipPath3, nil, -1, 8.454, 6.091, -1, 15, -1)
      CGPathAddLineToPoint(clipPath3, nil, 195, -1)
      CGPathCloseSubpath(clipPath3)
      
      CGContextSaveGState(ctx)
      CGContextAddPath(ctx, clipPath3)
      CGContextClip(ctx)
      
      CGContextTranslateCTM(ctx, 0, -2)
      CGContextSetShadowWithColor(ctx, CGSize(width: (214 * scaleFactor), height: 0), (0 * scaleFactor), shadowColor3)
      CGContextSetRGBFillColor(ctx, 0, 0, 0, 1)
      CGContextAddPath(ctx, shadowPath3)
      CGContextFillPath(ctx)
      
      CGContextRestoreGState(ctx)
      
      /*  Text   */
      let textBox = CGRect(x: 0, y: 10, width: 210, height: 20)
      
      var textStr: CFString = "Sign Off"
      if(isOn) {
        textStr = "Sign On"
      }
      
      let attributedStr = CFAttributedStringCreateMutable(kCFAllocatorDefault, 0)
      CFAttributedStringReplaceString(attributedStr, CFRange(location: 0, length: 0), textStr)
      
      let fontRef = CTFontCreateWithName("Arial-BoldMT", 16, nil)
      let textRange = CFRange(location: 0, length: CFAttributedStringGetLength(attributedStr))
      CFAttributedStringSetAttribute(attributedStr, textRange, kCTFontAttributeName, fontRef)
      
      let textColorComps: [CGFloat] = [1, 1, 1, 1]
      let textColor = CGColorCreate(colorSpace, textColorComps)
      CFAttributedStringSetAttribute(attributedStr, textRange, kCTForegroundColorAttributeName, textColor)
      
      var alignment = CTTextAlignment.TextAlignmentCenter
      var paragraphSettings = CTParagraphStyleSetting(spec: CTParagraphStyleSpecifier.Alignment, valueSize: UInt(sizeof(UInt8)), value: &alignment)
      let paragraphStyle = CTParagraphStyleCreate(&paragraphSettings, 1)
      CFAttributedStringSetAttribute(attributedStr, textRange, kCTParagraphStyleAttributeName, paragraphStyle)
      
      let textBoxPath = CGPathCreateWithRect(CGRect(x: 0, y: 0, width: textBox.size.width, height: textBox.size.height), nil)
      let framesetter = CTFramesetterCreateWithAttributedString(attributedStr)
      let frameRef = CTFramesetterCreateFrame(framesetter, CFRange(location: 0, length: 0), textBoxPath, nil)
      CGContextSaveGState(ctx)
      CGContextTranslateCTM(ctx, textBox.origin.x, textBox.origin.y)
      
      CGContextSetTextMatrix(ctx, CGAffineTransformIdentity)
      CGContextTranslateCTM(ctx, 0.0, textBox.size.height)
      CGContextScaleCTM(ctx, 1.0, -1.0)
      
      /*  Text Shadow  */
      CGContextSaveGState(ctx)
      let shadowColorComps4: [CGFloat] = [0, 0, 0, 1]
      let shadowColor4 = CGColorCreate(colorSpace, shadowColorComps4)
      CGContextSetShadowWithColor(ctx, CGSize(width: (0 * scaleFactor), height: (1 * scaleFactor)), (0 * scaleFactor), shadowColor4)
      CTFrameDraw(frameRef, ctx)
      CGContextRestoreGState(ctx)
      CGContextRestoreGState(ctx)
      
      let img = UIGraphicsGetImageFromCurrentImageContext() as UIImage
      self.setBackgroundImage(img,forState: .Normal)
      UIGraphicsEndImageContext()
    }
}
