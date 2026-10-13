#import "@preview/cetz:0.2.0": *
#import "@preview/simple-plot:0.1.0": *

#let project(title: "Modelling Optimal ILCA 7 Sail Trim from True Wind Velocity and Heading", logo: none, body) = {
  
  set document(title: title)
  set page(numbering: "1", number-align: top+right, margin: 2.5cm)
  set math.equation(numbering: "(1)")
  set text(font: "Libertinus Serif", size: 12pt)
  set par(justify: true, leading: 0.65em, first-line-indent:( amount: 1.5em, all: true))
  body
  
}

