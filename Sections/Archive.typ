#import "../template.typ": *
#counter(page).update(1) 
#set page(numbering: "1", number-align: top+right, margin: 2.5cm)

It is already well known that sailboats can move foreward even while travelling into the wind. However, because the bulk of this paper will rely on this fact, it is important that I establish a proof of it.

For the purposes of this paper, we will assume fluids are "perfect" in that they are inviscid, meaning that they have no viscosity, are incompressible such that their density remains constant, and are continuous such that they are not made up of discreet particles but rather one fluid continuum. Additionally, all fluid properties (e.g., viscosity, velocity, density etc.) must be differentiable.

#image("../Resources/betterairfoildiagram.png")

Figure 2: Airfoil Diagram. Adapted from @kapania_2008_modeling.

Sailboats can be broken down into 3 primary rigid components: the sail, the centerboard, and the rudder. We can think of these components as airfoils. An example of the cross-section of an airfoil is shown in _fig. 2_. The perspective shown by _fig. 2_ is representative of a top-down view of a sail, centerboard, or rudder.

In order to generate lift, airfoils must be moving relative to the fluid medium they are in such that said fluid flows around it. We can describe flow around  airfoils by  Fluid flow manifests in 4 forms.

First, uniform fluid flow can be defined as a flow orientated in the positive $x$ direction with free stream velocity $V_infinity$. To model this, we can use the polar coordinate system which entails plotting points and functions based on their angle to the positive $x$ axis. The uniform flow model will rely on the potential function 


$ phi = V_infinity r cos(theta) $ <ratio>


A potential function is a scalar function whose gradient yields a specific vector field. Here, $phi$ is a potential function of $x$ and $y$. 

Stream functions are functions defined such that $(partial Psi)/(partial y)$ gives the velocity component in the $x$ direction ($u$), and $(partial Psi)/(partial x)$ gives the velocity component in the negative $y$ direction ($-v$). @ratio therefore results in the stream function

$ Psi = V_infinity r sin(theta) $

Second, consider a flow where all streamlines are converging or diverging from a single origin point $O$. If the flow is converging to the central point, the flow is referred to as a sink flow. Conversely, if the flow is diverging from the central point, the flow is referred to as a source flow.@kapania_2008_modeling




Substituting $x$ for $theta$, this means that $z = e^(i theta)$ is a point that lies on the complex unit circle. Now that we have this defined, let's imagine the function $j=z+(a^2)/z$, where $j,z in CC$ and $a in RR$. If $z=r e^(i theta)$ ($r in RR$), meaning $z$ is on the unit circle:

$ j=r e^(i theta) + a^2/(r e^(i theta)) $
$ j=r(cos(theta) + i sin(theta))+1/r(cos(theta) + i sin(theta)) $
$ j=r(cos(theta) + i sin(theta))+1/r cos(theta) - i sin(theta) $

We can think of $j$ as being composed of its real and imaginary components

$ v=(r + 1/r)cos(theta) $ and $ u=(r - 1/r) sin(theta) $

Since $sin^2(theta)+cos^2(theta)=1$:

$ v^2/(r+1/r)^2 + u^2/(r-1/r)^2 = cos^2(theta) + sin^2(theta) $
$ v^2/(r+1/r)^2 + u^2/(r-1/r)^2  = 1 $