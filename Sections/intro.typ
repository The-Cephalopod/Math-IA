#import "../template.typ": *
#counter(page).update(1) 
#set page(numbering: "1", number-align: top+right, margin: 2.5cm)

I have been sailing since I was four years old, and much of my ability to trim my sails correctly has come from intuition and practice: adjusting the sail angle until the boat feels fastest. While this works well in familiar conditions, I want to understand the mathematics behind the change in force when I adjust the sail.

My initial interest was in predicting the best sail trim from the wind and the boat's motion. That would require a model of the whole boat, including water resistance and the changing sail shape. I have therefore narrowed this exploration to a question I can investigate explicitly: *How can the Joukowski transformation and potential-flow theory be used to derive the lift coefficient of an idealized ILCA 7 sail section as a function of angle of attack?*

The model treats a horizontal section through the sail. I will start with the complex numbers, vectors, differentiation and integration studied in Mathematics AA HL, then explain the extensions needed to construct the flow and calculate its force. The resulting coefficient will describe an illustrative idealized section, rather than a measured sail or a complete prediction of boat speed.

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