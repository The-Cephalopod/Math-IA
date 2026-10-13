#import "../template.typ": *
#counter(page).update(1) 
#set page(numbering: "1", number-align: top+right, margin: 2.5cm)

I have been sailing since I was four years old, and much of my ability to trim my sails correctly has come from intuition and practice adjusting the sail angle until the boat feels fastest. While this works well in familiar conditions, it can become unreliable in low wind or when sailing at unfamiliar headings. Since both true wind and boat motion can be represented using vectors, their relationship can be modeled mathematically through apparent wind. This IA *aims to derive a formula relating the optimal sail angle to true wind velocity and boat heading, using vectors and trigonometry to maximize velocity towards a heading.*

I must first define several potentially unfamiliar concepts needed to understand this paper.
#show figure: set block(breakable: true)
#figure(
align(center,
  table(
  
  inset: 6pt,
  columns: 2,
  
  [*Term*], [*Definition*],
  [Computational Fluid Dynamics (CFD)], [Fluid simulation done in software to predict the flow of fluids around an object.],
  [True Wind], [Wind speed and direction in relation to true north as measured by a stationary observer on the water.],
  [Apparent Wind], [Wind speed and direction in relation to true north as measured by a moving observer on the water.],
  [Bearing], [The angle between the boat's heading to a destination in relation to true north.],
  [The International Laser Class Association (ILCA)], [An organization that manages the Laser class of sailboats.@],
  [ILCA 7], [A specific boat in the Laser class.
  #linebreak()
  #image("../Resources/laserdiagramside.png")
  Figure 1: ILCA 7 Side Profile.
  #linebreak()
  Adapted from [].],
)))