#import "../template.typ": *
#counter(page).update(1) 
#set page(numbering: "1", number-align: top+right, margin: 2.5cm)

It is well known from qualitative experience that sailboats can move forward even while travelling into the wind. Sailboats can be broken down into 2 primary rigid components: the sail and the daggerboard. We can think of these components as foils. An example of the cross-section of a foil is shown in @airfoil-diagram. The perspective shown by @airfoil-diagram is representative of a top-down view of a sail, or daggerboard.

#figure(
  image("../Resources/betterairfoildiagram.png"),
  caption: [Airfoil Diagram. Adapted from @Kapania2008Modeling.],
) <airfoil-diagram>

For the purposes of this paper, we will assume fluids are "perfect" in that they are inviscid, meaning that they have no viscosity, are incompressible such that their density remains constant, are continuous such that they are not made up of discreet particles but rather one fluid continuum, and flow steadily (without changes in their properties over time @GERHARDT2011Unsteady) in a 2-dimensional field.

The end goal of this paper is to be able to calculate the sectional lift coefficient of an ILCA 7 sail using the formula

$ C_L = L'/(1/2 rho U^2_infinity c) $ <cl-definition>
#align(center,
table(
  align: center,
  columns: 2,
  rows: 5,
  [$C_L$], [Sectional lift coefficient],
  [$L'$], [Lift per unit span predicted by two-dimensional model],
  [$rho$], [Fluid density],
  [$U_infinity$], [Undisturbed apparent-wind speed],
  [$c$], [Chord length]
))

This sectional lift coefficient serves as an idealized representation of the ILCA 7 sail @GERHARDT2011Unsteady.

To begin, we must mathematically define an airfoil. We will begin to define an airfoil by defining a point on a complex unit circle. To do this, we first take the definition of $e$:

$ e=lim_(n->infinity)(1+1/n)^n $

We can extend this definition to exponentiate x:

$ e^x=lim_(n->infinity)[(1+1/n)^n]^x $
$ e^x=lim_(n->infinity)[(1+x/n)^(n/x)]^x $
$ e^x=lim_(n->infinity)(1+x/n)^(n) $

Using the same method, this definition can be extended to include $i$:

$ e^(i x)=lim_(n->infinity)(1+(i x)/n)^n $

Since we will be working in the complex plane, we need to step away from $e$ to define some complex number $z$:

$ z=a+i b $

Here, $a, b in RR$

For $z$, let $|z|$ be its magnitude such that $|z|=sqrt(a^2 + b^2)$ and $arg(z)$ be its angle such that $arg(z) = tan^(-1)(b/a)$.

By considering another complex number $zeta$ for which $zeta=xi+i eta$: 

$ |zeta z|=sqrt((a^2 + b^2)(xi^2 + eta^2)) $
$ |zeta z|=sqrt(a^2 + b^2)sqrt(xi^2 + eta^2) $
$ |zeta z|=|zeta|dot|z| $

$z$ and $zeta$ can also be written in their polar forms such that $z= r_z e^(i theta_z)$ and $w= r_zeta e^(i theta_zeta)$ where $r$ represents the number's modulus and $theta$ represents the number's argument. With this information:

$ z zeta = r_z e^ (i theta_z) r_zeta e^(i theta_zeta) $
$ = (r_z r_zeta)(e^ (i theta_z) e^(i theta_zeta)) $
$ = (r_z r_zeta)(e^ (i (theta_z + theta_zeta))) $
$ = (r_z r_zeta)(e^ ((theta_z + theta_zeta))) $

Let $r_z r_zeta = r_1$

Let $theta_z + theta_zeta = theta_1$

This results in:

$ z zeta = r_1 e^(i theta_1) $

Therefore:

$ arg(z zeta) = theta_1 $
$ arg(z zeta) = theta_z + theta_zeta $
$ arg(z zeta) = arg(z) + arg(zeta) $

To continue developing this foundation, we must show that the proposition $P_n$ is true, where $P_n$ is the proposition $|z^n|=|z|^n$ for all $n in ZZ$. For this, we can think of $ZZ$ as being composed of the sets $NN$ and $ZZ^-$.

I will begin this by showing that $P_n$ is true for all $n in NN$.

For $n=0$:

LHS: $|z^0|=1$

RHS: $|z|^0=1$

Since LHS = RHS, $P_n$ is true for $n=0$.

Let's assume that $P_k$ is true for all $k in NN$, meaning that $|z^k|=|z|^k$, $k in NN$. Now we must show that if $P_k$ is true, $P_(k+1)$, $|z^(k+1)|=|z|^(k+1)$, is also true, $k in NN$.

Proof:

$ |z^(k+1)| = |z^k dot z^1| $
$ |z^(k+1)| = |z^k||z^1| $
$ |z^(k+1)| = |z|^k|z|^1 $
$ |z^(k+1)| = |z|^(k+1) $

Since we have verified the base case $P_0$ and shown that if $P_k$ is true, $P_(k+1)$ is also true, by the principle of mathematical induction, $P_n$ is true, $n in NN$.

To continue, we must extend this proof to include $ZZ^(-)$, thereby extending it to all $ZZ$. To do so, we will prove the proposition $L_n$ for which $|z^n|=|z|^n$ for all $n in ZZ^-$:

For $n=-1$:

LHS: $|z^-1|=|1/z|$

$=1/(|z|)$

$=|z|^(-1)$

Since LHS = RHS, $L_n$ is true for $n=-1$.

Let's assume that $L_k$ is true for all $k in ZZ^-$, meaning that $|z^k|=|z|^k$, $k in ZZ^-$. Now we must show that if $L_k$ is true, $P_(k-1)$, $|z^(k-1)|=|z|^(k-1)$, is also true, $k in ZZ^-$.

Proof:

$ |z^(k-1)| = |z^k dot z^(-1)| $
$ |z^(k-1)| = |z^k||z^(-1)| $
$ |z^(k-1)| = |z|^k|z|^(-1) $
$ |z^(k-1)| = |z|^(k-1) $

Since we have verified the base case $L_(-1)$ and shown that if $L_k$ is true, $L_(k-1)$ is also true, by the principle of mathematical induction, $L_n$ is true, $n in ZZ^-$.

Combined, these two proofs show that $|z^n|=|z|^n$ for all $n in ZZ$.

Similarly:

$ z = r e^(i theta) $
$ z^n = r^n e^(n i theta) $
$ arg(z^n) = arg(r^n e^(n i theta)) $
$ arg(z^n) = n theta $
$ arg(z^n) = n arg(z) $

In summary, we have thus far shown that:

$ e^(i x)=lim_(n->infinity)(1+(i x)/n)^n $ <complex-exponential-limit>
$ |zeta z|=|zeta|dot|z| $ <modulus-product>
$ arg(z zeta) = arg(z) + arg(zeta) $ <argument-product>
$ |z^n|=|z|^n $ <modulus-power>
$ arg(z^n) = n arg(z) $ <argument-power>

Now let's consider the case that $1+(i x)/n$ from @complex-exponential-limit is the complex number $z=a + b i$ where $a=1$ and $b=x/n$. This means

$ |1+(i x)/n| = sqrt(1+ (x^2)/(n^2)) $ <increment-modulus>

and

$ tan(arg(1+(i x)/n)) = x/n $ <increment-argument>

Using @complex-exponential-limit, @modulus-power, and @increment-modulus:
$ |e^(i x)|=lim_(n->infinity)|1+(i x)/n|^n $
$ |e^(i x)|=lim_(n->infinity)(1+(x^2)/(n^2))^(n/2) $
$ |e^(i x)|=lim_(n->infinity)(1+(x^2)/(n^2))^((n^2)/(2n)) $
$ |e^(i x)|=lim_(n->infinity)e^((x^2)/(2n)) $
$ |e^(i x)|=1 $ <unit-modulus>

This means that $e^(i x)$ has magnitude 1.

The proof that $lim_(x->0) tan(x)/x =1$ is trivial, so it will be assumed. Using this and @increment-argument:

$ arg(e^(i x)) = lim_(n->infinity) n arg(1+(i x)/n) $
$ arg(e^(i x)) = lim_(n->infinity) n arg(1+(i x)/n) tan(arg(1+(i x)/n))/arg(1+(i x)/n) $
$ arg(e^(i x)) = lim_(n-?infinity) (n x)/n $
$ arg(e^(i x)) = x $ <exponential-argument>

Therefore, using @unit-modulus and @exponential-argument:

$ e^(i x) = cos(x) + i sin(x) $ <euler>

By substituting $x$ for $theta$, we have shown that $z = e^(i theta_z)$ is a point that lies on the complex unit circle.

As $t$ increases from $0$ to $2pi$, @euler traces the circle once counterclockwise. Multiplication by a radius $R>0$ enlarges it and addition of a centre $z_0=h+i k$ translates it:

$ z(t)=z_0+R e^(i t)=(h+R cos t)+i(k+R sin t), quad 0<=t<=2pi. $ <circle>

To create an airfoil from this complex unit circle, we will use conformal mapping. Conformal mapping is used to map one plane to another while preserving the angles between the tangent lines of intersecting, parameterized smooth curves in either plane. Complex functions can be mapped conformally if the function is analytic and its derivative at any conformally mapped point is nonzero. A function being "analytic" means that if we let $f: A->CC$ where $A subset CC$ is an open set (a set which does not include its boundary points), then $f$ must be differentiable at every point $z_0 in A$.

We previously defined the complex numbers $z = a + i b$ and $zeta = xi + i eta$. Now let's consider these same complex numbers to represent two planes. We will map the plane containing the unit circle $z = a + i b$ to the plane $zeta = xi + i eta$ to transform the unit circle into a foil.

We will begin this by first discussing complex differentiation. A complex function $f(z)$ is differentiable at a point $z_0$ if and only if the following limit difference quotient exists @Campuzano2019Complex:

$ f'(z_0) = lim_(z->z_0) (f(z)-f(z_0))/(z-z_0) $ <derivative-limit>

Let $Delta z = z-z_0$

$ f'(z_0) = lim_(Delta z->0) (f(z_0+Delta z)-f(z_0))/(Delta z) $ <derivative>

If we drop the subscript from $z_0$ and let $Delta w = f(z_0+Delta z)-f(z_0)$, then $Delta w$ denotes a change in $f(z)$ corresponding to a change in $Delta z$ at the point at which $f$ is evaluated @Campuzano2019Complex. Therefore:

$ (d w)/(d z)=lim_(Delta z->0) (Delta w)/(Delta z) $

You might notice that the derivative in @derivative for a complex-valued function is identical in form to that of a real-valued function. However, for $f'(z_0)$ to exist, the relevant limit must exist independent of the direction from which $z$ approaches $z_0$.

Other than this difference, the definition in @derivative means that complex numbers can be differentiated using the same rules applied to real numbers. 

Complex derivatives are a bit different from real derivatives in that they can be approached from any point on the complex plane (not just by the direction of the function being derivated). An important requirement is that the difference quotient approaches the same value regardless of the direction from which $Delta z$ approaches zero. To see this, let's consider $f(z)=z^2$. Substituting into @derivative gives:

$ f'(z_0)=lim_(Delta z->0) ((z_0+Delta z)^2-z_0^2)/(Delta z) $
$ f'(z_0)=lim_(Delta z->0)(2z_0+Delta z)=2z_0 $

Since $Delta z$ approaches zero along every path, this derivative exists. However, this is not true for every complex function @Campuzano2019Complex.

Now that we have defined complex differentiation, we can apply it to the transformation that will create our airfoil. For this, I will use the Joukowski transformation:

$ zeta=f(z)=z+a^2/z, quad a>0, quad z!=0 $ <joukowski>

Here, $a$ is a constant which determines the scale of the airfoil. From this point, we will write the original complex coordinate as $z=x+i y$, so that $a$ is no longer being used as its real part. The transformed coordinate remains $zeta=xi+i eta$.

To find the coordinates of the transformed point, we can multiply the numerator and denominator of $1/z$ by $x-i y$:

$ zeta=x+i y+(a^2 (x-i y))/(x^2+y^2) $
$ xi=x(1+a^2/(x^2+y^2)), quad eta=y(1-a^2/(x^2+y^2)) $ <mapped-coordinates>

Differentiating @joukowski gives:

$ f'(z)=1-a^2/z^2 $ <map-derivative>

We previously established that a conformal map must have a nonzero derivative. Here, $f'(z)=0$ at $z=a$ and $z=-a$, while $f(z)$ is undefined at $z=0$. We must therefore choose our circle so that these points do not lie in the surrounding fluid.

Recall that our circle has centre $z_0=h+i k$ and radius $R$. I will choose $h<0$ and make the circle pass through $z=a$. Its radius is therefore the distance between $z_0$ and $a$:

$ R=|a-z_0|=sqrt((a-h)^2+k^2) $ <circle-radius>

This point maps to $f(a)=2a$, forming the airfoil's sharp trailing edge @Campuzano2019Complex. The other two points lie inside the circle, since:

$ R^2-|-a-z_0|^2=(a-h)^2-(-a-h)^2=-4a h>0 $
$ R^2-|z_0|^2=(a-h)^2-h^2=a^2-2a h>0 $

In each case, the distance from the centre is less than $R$. Therefore, the map is conformal throughout the fluid outside the circle, with the trailing edge treated separately.

For the example in this paper, I will use $h/a=-0.05$ and $k/a=0.10$. The horizontal displacement gives the mapped shape thickness, while the vertical displacement bends the line midway between its upper and lower surfaces. This curvature is called camber. These values give us an idealized section to investigate; they have not been measured from an ILCA 7 sail.

#counter(figure.where(kind: image)).update(2)
#figure(
  image("../Resources/joukowski_section.svg", width: 100%),
  caption: [The circle and its image under the Joukowski transformation.],
) <geometry-plot>

To calculate $C_L$, we will need the chord length $c$. The chord is the straight line joining the leading and trailing edges. Let $zeta_T=2a$ be the trailing edge. For this profile, I will locate the leading edge, $zeta_L$, by finding the boundary point farthest from $zeta_T$.

Let $g(t)=f(z(t))=xi(t)+i eta(t)$ describe the mapped boundary, where $z(t)$ is the circle defined in @circle. The square of the distance from $g(t)$ to the trailing edge is:

$ H(t)=|g(t)-2a|^2=(xi(t)-2a)^2+eta(t)^2 $

Since distance is nonnegative, maximizing its square gives the same point as maximizing the distance itself. This also removes the square root before we differentiate:

$ H'(t)=2(xi(t)-2a)xi'(t)+2eta(t)eta'(t) $ <nose-condition>

The derivatives are found using the chain rule:

$ g'(t)=f'(z(t))z'(t)=(1-a^2/(z(t)^2))i R e^(i t) $

Here, $xi'(t)$ and $eta'(t)$ are the real and imaginary parts of $g'(t)$. Solving $H'(t)=0$ over $0<=t<=2pi$ and comparing the values of $H$ gives the maximum at $t approx 3.226974$. We can then calculate the chord length and its angle $delta$ to the positive $xi$-axis:

$ c=|zeta_T-zeta_L|, quad delta=arg(zeta_T-zeta_L) $

For the chosen circle:

$ R/a approx 1.054751, quad zeta_L/a approx -2.009174+0.001759i $
$ c/a approx 4.009174, quad delta approx -0.000438784 $ <geometry-values>

We must also define the angle at which the air flows towards the section. Let $chi$ be the angle of the undisturbed air velocity to the positive $xi$-axis. I will define the angle of attack, $alpha$, as the signed angle from the chord to this velocity direction. Therefore:

$ alpha=chi-delta, quad chi=alpha+delta $ <incidence>

All angles will be in radians unless a degree symbol is shown.

Now that we have defined the airfoil, we must describe the flow around it. I will begin with the flow around the circle, since its boundary is simpler, and then use the same transformation to obtain the flow around the airfoil.

Let $u_z (x,y)$ and $v_z (x,y)$ be the horizontal and vertical components of velocity in the circle plane. Together, these form the velocity vector $bold(V)_z=(u_z,v_z)$. The subscript $z$ identifies the plane in which we are working.

Since the velocity depends on both $x$ and $y$, we need a way to differentiate a function of two variables. We can do this by holding one variable constant while differentiating with respect to the other. This is called partial differentiation, and is executed in the same way as regular differentiation. For a function $S(x,y)$:

$ S_x=frac(partial S,partial x)=lim_(epsilon->0)(S(x+epsilon,y)-S(x,y))/epsilon $
$ S_y=frac(partial S,partial y)=lim_(epsilon->0)(S(x,y+epsilon)-S(x,y))/epsilon $

For example, if $S(x,y)=x^2 y$, then $S_x=2x y$ and $S_y=x^2$. The subscript tells us which variable changes. Similarly, $S_(x x)$ means differentiating twice with respect to $x$, and $S_(x y)$ means differentiating first with respect to $x$ and then with respect to $y$. The two mixed derivatives, $S_(x y)$ and $S_(y x)$, are equal when these second derivatives are continuous, as they will be for the functions used in the fluid region below.

We can now express our flow assumptions mathematically. Since the fluid is incompressible, the volume entering a small rectangle must equal the volume leaving it. For a rectangle of width $Delta x$ and height $Delta y$, the net outward flow through its vertical sides is approximately:

$ [u_z (x+Delta x,y)-u_z (x,y)]Delta y
  approx frac(partial u_z,partial x)Delta x Delta y $

The horizontal sides similarly contribute $(partial v_z/partial y)Delta x Delta y$. Adding these contributions, dividing by the rectangle's area, and letting its dimensions approach zero gives:

$ frac(partial u_z,partial x)+frac(partial v_z,partial y)=0 $ <incompressibility>

I will also assume that the flow is irrotational, meaning that a small fluid element has no net rotation about its own centre. This is an additional assumption to those stated at the beginning. Mathematically, it requires:

$ frac(partial v_z,partial x)-frac(partial u_z,partial y)=0 $ <irrotationality>

The difference on the left is called vorticity. The first term measures the turning of a small horizontal segment, while the negative of the second measures the turning of a small vertical segment. Their average gives the rotation of the fluid element. Thus, zero vorticity allows the fluid to follow a curved path without the element itself rotating. @Olver2024Complex

To construct a flow with this property, let $phi(x,y)$ be a function whose partial derivatives give the velocity components:

$ u_z=phi_x, quad v_z=phi_y $ <velocity-potential>

This function is called the velocity potential. We can think of it as an antiderivative for the velocity. Substituting these expressions into @irrotationality gives $phi_(y x)-phi_(x y)=0$, so the flow is irrotational. Substituting them into @incompressibility gives:

$ phi_(x x)+phi_(y y)=0 $ <laplace>

We now need a velocity potential which satisfies this equation and prevents the fluid from passing through the circle.

To do this, we will use a stream function, $psi(x,y)$, defined by:

$ psi_x=-v_z, quad psi_y=u_z $ <stream-definition>

A streamline is a curve which follows the direction of the velocity at every point. To see how $psi$ describes these curves, consider a small displacement $(d x,d y)$. For a differentiable function of two variables, its change is the sum of the changes due to each coordinate:

$ d psi=psi_x d x+psi_y d y=-v_z d x+u_z d y $ <stream-differential>

Along a streamline, $(d x,d y)$ is proportional to $(u_z,v_z)$, so the two terms cancel. Therefore, $d psi=0$, meaning that $psi$ is constant along a streamline. If we make $psi$ constant on the circle, the velocity will follow its boundary and no fluid will pass through it.

We now have two functions describing the same flow. We can combine them into a single complex function:

$ W(z)=phi(x,y)+i psi(x,y) $

This is called the complex potential. To find its derivative, we can approach a point horizontally or vertically. The horizontal approach gives $W'=phi_x+i psi_x$, while the vertical approach gives:

$ W'=(phi_y+i psi_y)/i=psi_y-i phi_y $

For these expressions to agree, their real and imaginary parts must be equal:

$ phi_x=psi_y, quad phi_y=-psi_x $ <cauchy-riemann>

These equations are now satisfied by our definitions of $phi$ and $psi$. With continuous partial derivatives, they also make the derivative agree in every other direction, since:

$ d W=(phi_x+i psi_x)d x+(phi_y+i psi_y)d y $
$ d W=(phi_x+i psi_x)(d x+i d y)=(phi_x+i psi_x)d z $

Dividing by $d z$, or equivalently taking the limit of the corresponding difference quotient, gives:

$ W'(z)=phi_x+i psi_x=u_z-i v_z $ <complex-velocity>

This is the connection we need: differentiating one complex function gives both components of the fluid velocity. Its real part is the horizontal component, and the negative of its imaginary part is the vertical component. Also, differentiating @cauchy-riemann gives $phi_(x x)+phi_(y y)=psi_(y x)-psi_(x y)=0$, so an analytic complex potential satisfies Laplace's equation.

To construct this potential, let $w=z-z_0$. This measures position relative to the centre of the circle, so its boundary is $|w|=R$. Far from the circle, the air should have speed $U_infinity$ and direction $chi$. Its velocity components are therefore $U_infinity cos chi$ and $U_infinity sin chi$. Using @complex-velocity and Euler's formula:

$ W'_"uniform"=U_infinity cos chi-i U_infinity sin chi=U_infinity e^(-i chi) $

Integrating gives $W_"uniform"=U_infinity e^(-i chi)w$. However, this uniform flow would pass through the circle. We must add a term which changes the flow near the boundary while having a diminishing effect farther away.

For this, let's consider $A/w$, where $A$ is a complex constant. Its derivative is $-A/w^2$, so its contribution to the velocity approaches zero as $|w|$ increases. The combined potential is:

$ W_0=U_infinity e^(-i chi)w+A/w $

On the circle, $w=R e^(i theta)$, where $theta$ is the angle measured about the circle's centre. Substituting:

$ W_0=U_infinity R e^(i(theta-chi))+(A/R)e^(-i theta) $

We want the imaginary part, $psi$, to be constant on this boundary. Choosing $A=U_infinity R^2 e^(i chi)$ makes the two terms complex conjugates:

$ W_0=U_infinity R[e^(i(theta-chi))+e^(-i(theta-chi))] $
$ W_0=2U_infinity R cos(theta-chi) $

This is real, so $psi=0$ everywhere on the circle. Therefore:

$ W_0 (z)=U_infinity (e^(-i chi)w+(R^2 e^(i chi))/w) $ <circle-potential>

The reciprocal term is called a doublet. Together, these two terms give the required velocity far away and prevent flow through the circle. @Campuzano2019Complex

There is still another way to change the flow without violating either requirement: we can add a velocity which moves tangentially around the circle and decreases with distance. To describe this contribution, we must first define circulation.

Circulation measures the velocity accumulated along a closed path. Consider a path $C$ parameterized by $(x(t),y(t))$, where $t_0<=t<=t_1$. For a small displacement $(d x,d y)$, the dot product $u_z d x+v_z d y$ measures the contribution of velocity along that displacement. Adding these contributions around the path gives a line integral:

$ integral.cont_C (u_z d x+v_z d y)
  =integral_(t_0)^(t_1)[u_z x'(t)+v_z y'(t)]d t $ <line-integral>

The circle on the integral sign means that the path is closed. The right side shows how we calculate it using an ordinary definite integral. I will take $C$ counterclockwise and define clockwise circulation as positive:

$ Gamma=-integral.cont_C (u_z d x+v_z d y) $ <circulation>

The potential in @circle-potential has zero circulation. This follows because $u_z d x+v_z d y=d phi$, and its potential returns to the same value after one complete circuit.

Now let $r=|w|$ be the distance from the centre and let $V_theta$ be an additional velocity component in the counterclockwise tangential direction. Choosing:

$ V_theta=-Gamma/(2pi r) $

gives the required circulation, since a circle of radius $r$ has arc-length element $d s=r d theta$, and hence:

$ -integral_0^(2pi)V_theta r d theta
  =Gamma/(2pi)integral_0^(2pi)d theta=Gamma $

The counterclockwise unit tangent is $(-sin theta,cos theta)$. Therefore, the horizontal and vertical components of this added flow are:

$ u_"vortex"=(Gamma sin theta)/(2pi r), quad
  v_"vortex"=-(Gamma cos theta)/(2pi r) $

Using @complex-velocity:

$ W'_"vortex"=u_"vortex"-i v_"vortex"
  =(i Gamma e^(-i theta))/(2pi r)=(i Gamma)/(2pi w) $

To integrate this expression, we need the complex equivalent of $ln$. Since $w/R=(r/R)e^(i theta)$, let:

$ op("Log")(w/R)=ln(r/R)+i theta $ <complex-logarithm>

Exponentiating the right side returns $w/R$. Differentiating this inverse relationship gives:

$ e^(op("Log")(w/R)) d/(d w)op("Log")(w/R)=1/R $
$ d/(d w)op("Log")(w/R)=1/w $

Therefore, the additional potential is $(i Gamma/(2pi))op("Log")(w/R)$. This is called a vortex potential. Its velocity is tangential to the circle and approaches zero as $r$ increases. @Campuzano2019Complex

There is one difference from the real logarithm. After going once counterclockwise around the centre, $theta$ increases by $2pi$. The logarithm therefore increases by $2pi i$, and the real part of the vortex potential changes by $-Gamma$. This explains why the new potential can have nonzero circulation. Its derivative $1/w$ still has a unique value at every point outside the circle, so the velocity is well defined.

Adding the vortex potential to @circle-potential gives:

$ W(z)=U_infinity (e^(-i chi)w+(R^2 e^(i chi))/w)
  +(i Gamma)/(2pi)op("Log")(w/R) $ <full-potential>

To check the boundary condition, we can substitute $w=r e^(i theta)$ and take the imaginary part:

$ psi(r,theta)=U_infinity (r-R^2/r)sin(theta-chi)
  +Gamma/(2pi)ln(r/R) $ <stream-function>

At $r=R$, both terms are zero. Therefore, the circle is still a streamline for any value of $Gamma$. We will determine which value is appropriate after mapping the flow to the airfoil.

To transfer the potential to the airfoil plane, we assign each point $zeta=f(z)$ the potential of its corresponding point $z$ outside the circle. Let $tilde(W)$ denote this transformed potential:

$ tilde(W)(zeta)=W(z), quad z=f^(-1)(zeta) $

Here, $f^(-1)$ means the inverse which returns a point outside the generating circle. The Joukowski map is one-to-one on this exterior region, so each fluid point has one corresponding point there. We can now use the chain rule to find the new velocity. Since $d zeta/d z=f'(z)$:

$ (d tilde(W))/(d zeta)=(d W)/(d z)(d z)/(d zeta)=frac(W'(z),f'(z)) $

Let $q(zeta)=u-i v$ be the complex velocity in the airfoil plane, where $u$ and $v$ are its horizontal and vertical components. Differentiating @full-potential and substituting @map-derivative gives:

$ q(zeta)=frac(U_infinity (e^(-i chi)-(R^2 e^(i chi))/w^2)+(i Gamma)/(2pi w),1-a^2/z^2) $ <mapped-velocity>

The division by $f'(z)$ accounts for the change in distances caused by the transformation. Where the map stretches a small displacement by $|f'(z)|$, the speed decreases by that factor. The boundary remains a streamline because the corresponding points still have $psi=0$.

Circulation is also preserved. Multiplying the chain-rule equation by $d zeta$ gives $q d zeta=W'(z)d z$. Taking real parts:

$ u d xi+v d eta=u_z d x+v_z d y $

Thus, integrating around corresponding closed paths gives the same $Gamma$ in both planes. Far from the section, $f'(z)$ approaches $1$, so the undisturbed velocity also remains unchanged.

We can now determine $Gamma$ by considering the trailing edge. At its original point $z=a$, the denominator of @mapped-velocity is zero. If the numerator were nonzero, the model would predict an infinite speed there. To prevent this, we impose the Kutta condition: the flow must leave the sharp trailing edge smoothly with finite velocity. This is an additional physical condition used to select the circulation. @Darmofal2005Kutta

We therefore require $W'(a)=0$. To evaluate this, let $beta$ describe the direction from the circle centre to $a$:

$ a-z_0=R e^(-i beta), quad beta=arctan(k/(a-h)) $ <beta>

The negative sign in the exponential comes from $a-z_0=(a-h)-i k$. Also, $a-h>0$, so the inverse tangent gives the required angle. Substituting $w=R e^(-i beta)$ into $W'(z)$ gives:

$ W'(a)=U_infinity (e^(-i chi)-e^(i chi+2i beta))
  +(i Gamma e^(i beta))/(2pi R) $

Factoring out $e^(i beta)$ from the exponential difference:

$ e^(-i chi)-e^(i chi+2i beta)
  =e^(i beta)[e^(-i(chi+beta))-e^(i(chi+beta))] $

Using Euler's formula, the expression in square brackets equals $-2i sin(chi+beta)$. Therefore:

$ W'(a)=i e^(i beta)[-2U_infinity sin(chi+beta)+Gamma/(2pi R)] $

Since $i e^(i beta)!=0$, setting $W'(a)=0$ gives:

$ -2U_infinity sin(chi+beta)+Gamma/(2pi R)=0 $
$ Gamma=4pi R U_infinity sin(chi+beta) $
$ Gamma=4pi R U_infinity sin(alpha+delta+beta) $ <selected-circulation>

We must still check that this produces a finite velocity, since both the numerator and denominator of @mapped-velocity now approach zero. Using the definition of a derivative:

$ lim_(z->a)frac(W'(z),z-a)=W''(a), quad
  lim_(z->a)frac(f'(z),z-a)=f''(a) $

These equations use $W'(a)=f'(a)=0$. Dividing the two limits therefore gives the trailing-edge velocity $q_T$:

$ q_T=lim_(z->a)frac(frac(W'(z),z-a),frac(f'(z),z-a))
  =frac(W''(a),f''(a)) $ <trailing-limit>

Differentiating once more:

$ W''(z)=(2U_infinity R^2 e^(i chi))/w^3-(i Gamma)/(2pi w^2),
  quad f''(a)=2/a $

Since $w=a-z_0!=0$ at this point and $a>0$, the numerator is finite and the denominator is nonzero. This confirms that the selected circulation satisfies the finite-velocity requirement.

Now that we know the velocity around the airfoil, we must relate it to the force on the section. We will do this by finding the pressure and then adding its contributions around the boundary.

Let $p$ be the pressure, which is force per unit area, and let $V$ be the fluid speed along a streamline. Consider a short fluid element of length $d s$ and cross-sectional area $A$. If pressure increases by $d p$ along it, the net pressure force is $-A d p$. The minus sign means that the force acts towards the lower pressure. Its mass is $rho A d s$.

Let $tau$ represent time. Since the flow is steady, a particle's speed changes as it moves to a new position along the streamline. Using the chain rule and $d s/d tau=V$:

$ (d V)/(d tau)=(d V)/(d s)(d s)/(d tau)=V frac(d V,d s) $

Applying Newton's second law:

$ -A d p=rho A d s V frac(d V,d s) $
$ d p=-rho V d V $

The density is constant, so integrating between the undisturbed flow and a point on the streamline gives:

$ p-p_infinity=-1/2 rho(V^2-U_infinity^2) $
$ p+1/2 rho V^2=p_infinity+1/2 rho U_infinity^2 $ <bernoulli>

Here, $p_infinity$ is the pressure far from the section. This is Bernoulli's equation for flow at constant height. The irrotational assumption allows the same constant to be used throughout the fluid. To see why, the horizontal component of Newton's second law is:

$ p_xi=-rho(u u_xi+v u_eta) $

The terms in brackets are the horizontal acceleration, obtained from $d u/d tau=u_xi (d xi/d tau)+u_eta (d eta/d tau)$, with $d xi/d tau=u$ and $d eta/d tau=v$. Since irrotationality gives $u_eta=v_xi$:

$ frac(partial,partial xi)[p+1/2 rho(u^2+v^2)]
  =rho v(v_xi-u_eta)=0 $

The derivative with respect to $eta$ is similarly zero. Therefore, the quantity in brackets is constant throughout the connected flow region, and its value is fixed by the undisturbed flow. @Yue2005Marine

Since $q=u-i v$, the speed is $V=|q|=sqrt(u^2+v^2)$. We can express the pressure relative to $p_infinity$ using the pressure coefficient $C_p$:

$ C_p=(p-p_infinity)/(1/2 rho U_infinity^2)=1-frac(abs(q)^2,U_infinity^2) $ <pressure>

This means that where the air moves faster than $U_infinity$, the pressure is lower than $p_infinity$. For example, if $V=2U_infinity$, then $C_p=1-4=-3$.

To plot the pressure around the section, let $X$ be the distance along the chord measured from the leading edge. If $zeta_L=xi_L+i eta_L$, projecting onto the chord direction gives:

$ X=(xi-xi_L)cos delta+(eta-eta_L)sin delta $

The ratio $X/c$ therefore runs from $0$ at the leading edge to $1$ at the trailing edge. Evaluating @mapped-velocity and @pressure along the upper and lower surfaces gives:

#figure(
  image("../Resources/pressure_coefficients.svg", width: 100%),
  caption: [Pressure coefficients on the section at $alpha=5 degree$. Negative pressure coefficients are plotted upward.],
) <pressure-plot>

The pressure over much of the upper surface is lower than on the lower surface. This suggests an upward force, but to calculate the lift we must account for both the pressure and the direction of the surface at every point.

Let $C$ be the airfoil boundary traced counterclockwise by $zeta(t)=xi(t)+i eta(t)$, where $0<=t<=2pi$. Its tangent vector is $(xi'(t),eta'(t))$. By Pythagoras, a small boundary element has length:

$ d s=sqrt(xi'(t)^2+eta'(t)^2)d t $

At a smooth boundary point, the pressure force is perpendicular to this tangent. Rotating the tangent $90 degree$ clockwise gives $(eta'(t),-xi'(t))$, which points outward because we are moving counterclockwise around the section. Dividing by its magnitude gives the outward unit normal, $bold(n)$:

$ bold(n)=frac((eta'(t),-xi'(t)),sqrt(xi'(t)^2+eta'(t)^2)) $
$ bold(n)d s=(d eta,-d xi) $

For a unit span, the surface element has area $d s$, so the force on it is $d bold(F)=-p bold(n)d s$. The negative sign accounts for pressure pushing into the section. Adding these forces around the boundary gives:

$ F_xi=-integral.cont_C p d eta, quad F_eta=integral.cont_C p d xi $ <pressure-force>

Here, $F_xi$ and $F_eta$ are the horizontal and vertical forces per unit span. As with @line-integral, these can be evaluated using the boundary parameter. For example:

$ F_xi=-integral_0^(2pi)p(t)eta'(t)d t $ <pressure-parameter>

In this expression, $p(t)$ means the pressure at the point $zeta(t)$. We can also replace $p$ by $p-p_infinity$: a constant pressure contributes zero because $integral.cont_C d xi=integral.cont_C d eta=0$ on a closed boundary.

To simplify the two force components together, we will write them as the complex number $F_xi-i F_eta$. We must first define integration along a complex curve. If $G(zeta)=A(xi,eta)+i B(xi,eta)$, then:

$ integral_C G(zeta)d zeta
  =integral_(t_0)^(t_1)G(zeta(t))zeta'(t)d t $ <complex-integral>

This is called a complex contour integral, where a contour is the curve along which we integrate. Multiplying $G=A+i B$ by $d zeta=d xi+i d eta$ shows that it is composed of two real line integrals:

$ integral_C G d zeta
  =integral_C (A d xi-B d eta)+i integral_C (B d xi+A d eta) $ <integral-components>

Since $d overline(zeta)=d xi-i d eta$, we can combine @pressure-force as follows:

$ F_xi-i F_eta=-integral.cont_C p d eta-i integral.cont_C p d xi $
$ F_xi-i F_eta=-i integral.cont_C p d overline(zeta) $

Substituting the pressure from @bernoulli and removing the constant terms gives:

$ F_xi-i F_eta=(i rho)/2 integral.cont_C |q|^2 d overline(zeta) $

On the boundary, $psi$ is constant. Therefore, $d tilde(W)=d phi+i d psi=d phi$ is real. We also know that $d tilde(W)=q d zeta$. A real number equals its complex conjugate, so:

$ q d zeta=overline(q)d overline(zeta) $

Multiplying both sides by $q$:

$ q^2 d zeta=q overline(q)d overline(zeta)=|q|^2 d overline(zeta) $

We can therefore write the force as:

$ F_xi-i F_eta=(i rho)/2 integral.cont_C q(zeta)^2 d zeta $ <blasius>

This is Blasius' force formula. @Olver2024Complex It allows us to calculate both force components from the complex velocity alone.

The remaining integral follows the airfoil's curved boundary. It would be easier to evaluate it on a large circle, where the velocity approaches the undisturbed flow. To make this change, we will use Cauchy's theorem: if a function is analytic throughout the region between two closed curves, its integrals around those curves are equal when both are taken counterclockwise. @Campuzano2019Complex

We can understand this result using Green's theorem. For functions $P(xi,eta)$ and $Q(xi,eta)$ with continuous first partial derivatives on a region $D$ and its boundary, it states:

$ integral.cont_(partial D) (P d xi+Q d eta)
  =integral.double_D (Q_xi-P_eta)d A $

Here, $partial D$ means the boundary of the region, and the double integral adds the quantity $Q_xi-P_eta$ over small area elements $d A$. The boundary is followed with the region on the left: counterclockwise around its outside and clockwise around any hole. This formula comes from applying the fundamental theorem of calculus to small rectangles. The integrals along shared edges cancel, leaving only the boundary of the whole region.

Now consider $G=A+i B$ in @integral-components. For its real part, $P=A$ and $Q=-B$, so Green's theorem gives the area integrand $-B_xi-A_eta$. For its imaginary part, $P=B$ and $Q=A$, giving $A_xi-B_eta$. If $G$ is analytic, the Cauchy-Riemann equations give:

$ A_xi=B_eta, quad A_eta=-B_xi $

Both area integrands are therefore zero. If $C_s$ is the outer curve and $C_0$ the inner curve, each taken counterclockwise, this gives:

$ integral.cont_(C_s)G d zeta-integral.cont_(C_0)G d zeta=0 $
$ integral.cont_(C_0)G d zeta=integral.cont_(C_s)G d zeta $ <contour-deformation>

The subtraction occurs because the inner curve is followed clockwise as part of the region's boundary. We can apply this to $G=q^2$, which is analytic outside the airfoil. Taking $C_0$ towards the airfoil surface gives the integral in @blasius; the finite trailing-edge velocity ensures that this boundary limit is finite.

We will take the outer curve to be a circle of radius $s$ centred at the origin of the airfoil plane. To evaluate the integral as $s$ increases, we need to know which terms in $q^2$ remain significant far from the airfoil.

Recall that $w=z-z_0$ and $zeta=z+a^2/z$. Far away, both $w/z$ and $zeta/z$ approach $1$, so their magnitudes become comparable. Also:

$ 1/w-1/zeta=(zeta-w)/(w zeta)=(z_0+a^2/z)/(w zeta) $
$ 1/(1-a^2/z^2)-1=(a^2/z^2)/(1-a^2/z^2) $

Both differences decrease at least as fast as $1/(abs(zeta)^2)$. The doublet's velocity also decreases at this rate because it contains $1/w^2$. Therefore, @mapped-velocity can be written as:

$ q(zeta)=U_infinity e^(-i chi)+(i Gamma)/(2pi zeta)+E_1 (zeta) $

Here, $E_1$ contains the remaining terms, and there is a constant $K_1>0$ such that $|E_1 (zeta)|<=K_1/(abs(zeta)^2)$ sufficiently far from the airfoil. Squaring gives:

$ q(zeta)^2=U_infinity^2 e^(-2i chi)
  +(i U_infinity Gamma e^(-i chi))/(pi zeta)+E_2 (zeta) $ <far-field>

The second term comes from twice the product of the first two terms in $q$. All other terms are included in $E_2$, which similarly satisfies $|E_2 (zeta)|<=K_2/(abs(zeta)^2)$ for some constant $K_2>0$.

To integrate around the large circle, let $zeta=s e^(i t)$, where $0<=t<=2pi$. The constant term in @far-field integrates to zero because $integral.cont d zeta=0$. For the reciprocal term:

$ integral.cont_(C_s) frac(d zeta,zeta)
  =integral_0^(2pi) frac(i s e^(i t),s e^(i t))d t
  =integral_0^(2pi)i d t=2pi i $

The magnitude of the remaining integral is no greater than the maximum magnitude of $E_2$ multiplied by the circle's circumference:

$ abs(integral.cont_(C_s)E_2 (zeta)d zeta)
  <=K_2/s^2 dot 2pi s=(2pi K_2)/s $

As $s->infinity$, this approaches zero. Since @contour-deformation gives the same integral for every sufficiently large circle, only the reciprocal term contributes to the final value. Substituting into @blasius:

$ F_xi-i F_eta=(i rho)/2 ((i U_infinity Gamma e^(-i chi))/pi)(2pi i) $
$ F_xi-i F_eta=-i rho U_infinity Gamma e^(-i chi) $

Using $e^(-i chi)=cos chi-i sin chi$ and equating real and imaginary parts:

$ F_xi=-rho U_infinity Gamma sin chi, quad
  F_eta=rho U_infinity Gamma cos chi $ <force-components>

We now have the total force per unit span. To find lift, we must take its component perpendicular to the undisturbed velocity. The unit vector in the flow direction is $(cos chi,sin chi)$. Rotating this $90 degree$ counterclockwise gives $(-sin chi,cos chi)$, which I will use as the positive lift direction. Taking the dot product:

$ L'=-F_xi sin chi+F_eta cos chi $
$ L'=rho U_infinity Gamma(sin^2 chi+cos^2 chi) $
$ L'=rho U_infinity Gamma $ <kutta-joukowski>

This is the Kutta-Joukowski lift formula for our clockwise-positive definition of $Gamma$. The force component parallel to the flow is the drag per unit span, $D'$:

$ D'=F_xi cos chi+F_eta sin chi=0 $

Therefore, this ideal flow produces a force perpendicular to the apparent wind, with no drag.

We can now return to the sectional lift coefficient defined at the beginning. Substituting @kutta-joukowski into @cl-definition:

$ C_L=L'/(1/2 rho U_infinity^2 c)
  =(rho U_infinity Gamma)/(1/2 rho U_infinity^2 c)
  =(2Gamma)/(U_infinity c) $

Finally, using @selected-circulation:

$ C_L (alpha)=(8pi R)/c sin(alpha+delta+beta) $ <final-coefficient>

This gives the lift coefficient in terms of the angle of attack and the section's geometry. The density and wind speed cancel because the coefficient measures lift relative to $rho U_infinity^2 c/2$. The geometric scale also cancels: enlarging every length by the same factor leaves $R/c$ and the angles unchanged.

For the chosen section, @beta gives $beta approx 0.094951706$. Combining this with @geometry-values:

$ C_L (alpha) approx 6.612032 sin(alpha+0.094512922) $ <numerical-coefficient>

For example, at $alpha=5 degree=5pi/180$:

$ C_L approx 6.612032 sin(5pi/180+0.094512922) approx 1.195323 $

To check this result, I will also calculate the force directly from the pressure integral in @pressure-force. Dividing $0<=t<=2pi$ into $N$ equal intervals gives $Delta t=2pi/N$. On each interval, we can approximate the integrand by its value at the midpoint:

$ t_j=frac(2pi,N) (j+1/2), quad j=0,1,dots,N-1 $

Let $p_j^*=p(t_j)-p_infinity$. Multiplying each midpoint value by $Delta t$ and adding gives:

$ F_xi approx -(2pi)/N sum_(j=0)^(N-1)p_j^* eta'(t_j) $
$ F_eta approx (2pi)/N sum_(j=0)^(N-1)p_j^* xi'(t_j) $ <numerical-force>

We then resolve these forces into $L'$ and $D'$ as above. Dividing by $rho U_infinity^2 c/2$ gives $C_L$ and the corresponding drag coefficient $C_D$. The primes on $xi$ and $eta$ denote differentiation with respect to $t$; the primes on $L'$ and $D'$ denote force per unit span.

Using $a=U_infinity=rho=1$ and $alpha=5 degree$ gives the following values. This choice of units does not affect the coefficients. The calculations are reproduced in the accompanying `calculations.py` file.

#figure(
  table(
    align: center,
    columns: 3,
    [*$N$*], [*Numerical $C_L$*], [*Numerical $C_D$*],
    [32], [1.190231642], [$-3.3063 times 10^(-3)$],
    [64], [1.195496079], [$1.7163 times 10^(-4)$],
    [128], [1.195322877], [$4.0266 times 10^(-7)$],
    [256], [1.195322725], [$1.1736 times 10^(-12)$],
  ),
  caption: [Direct pressure integration at $alpha=5 degree$, compared with the analytical results $C_L approx 1.195322725$ and $C_D=0$.],
) <convergence-table>

As $N$ increases, the calculated lift coefficient approaches the analytical result and the drag coefficient approaches zero. The agreement supports the derivation, while the small nonzero drag at lower values of $N$ shows the effect of approximating a curved boundary with too few intervals. Both calculations use the same ideal-flow assumptions, so this checks their mathematical consistency rather than their accuracy for a real sail.

To investigate how the section's shape affects lift, I will keep $h/a=-0.05$ and compare $k/a=0$, $0.05$, and $0.10$. For each value, I recalculate $R$, $c$, $delta$, and $beta$ using the same method. This changes the geometry of the whole section, including its camber.

#figure(
  image("../Resources/lift_coefficients.svg", width: 100%),
  caption: [Sectional lift coefficient against angle of attack for three vertical offsets of the generating circle.],
) <lift-plot>

When $k=0$, the section is symmetric and produces zero lift at $alpha=0$. Increasing $k$ shifts the zero-lift angle towards a negative value. We can find this angle directly from @final-coefficient by setting $C_L=0$. The solution nearest $alpha=0$ satisfies:

$ alpha+delta+beta=0 $
$ alpha_0=-(delta+beta) $ <zero-lift>

Here, $alpha_0$ is the zero-lift angle. For the three sections, it is approximately $0 degree$, $-2.71391 degree$, and $-5.41519 degree$, respectively. Therefore, the chosen cambered section produces positive lift even when its chord is aligned with the flow.

The curves also appear nearly straight over the plotted range. We can explain this by writing @final-coefficient as:

$ C_L=(8pi R)/c sin(alpha-alpha_0) $

For a small angle $epsilon$ in radians, $sin epsilon approx epsilon$. Therefore, close to the zero-lift angle:

$ C_L approx (8pi R)/c (alpha-alpha_0) $

To calculate the rate of change more precisely, we can differentiate the original expression:

$ (d C_L)/(d alpha)=(8pi R)/c cos(alpha+delta+beta) $ <lift-slope>

For our chosen section at $alpha=0$, this gives approximately $6.58252$ per radian. Since one degree is $pi/180$ radians, the corresponding rate per degree is $6.58252(pi/180) approx 0.114887$. Thus, near zero incidence, increasing the angle of attack by one degree increases the predicted coefficient by approximately $0.115$.

We can also check the formula by considering an increasingly thin, symmetric section. Setting $k=0$ and allowing $h$ to approach zero from below gives $R->a$, $c->4a$, and $delta=beta=0$. Therefore:

$ C_L->(8pi a)/(4a)sin alpha=2pi sin alpha $

For small $alpha$, this becomes $C_L approx 2pi alpha$, which agrees with the thin-airfoil lift slope. @Darmofal2005Thin I use this as a limiting check; the rounded leading edge is retained in the pressure calculation above.

This result helps explain the sail's contribution to forward motion. Although lift acts perpendicular to the apparent wind, it can have a forward component relative to the boat. It also produces a sideways component, which the daggerboard helps resist through its force on the water. Calculating the boat's speed would require these forces to be balanced with the resistance of the hull and the rest of the boat. @Viola2011Sail

There are several limitations when applying this result to an ILCA 7. First, the circle offsets were chosen to give an illustrative cambered section. To calculate a coefficient for a particular sail, I would need to measure its section and determine how closely a Joukowski profile could represent it. A real sail also changes shape with its controls and the wind loading, while this model assumes a fixed profile.

Second, the assumptions exclude viscosity and flow separation, where the air stops following the sail's surface. Consequently, the model cannot predict stall, and the zero drag obtained above does not represent a real sail. Experimental sail-pressure measurements show separation and reattachment that this model does not include. @Viola2011Sail The formula's increase in lift over the plotted interval therefore cannot by itself establish the best sailing angle.

Finally, this is a two-dimensional section. An ILCA sail has finite height, and its chord, shape, and angle to the apparent wind vary with height. A single sectional coefficient is therefore insufficient to determine the total force on the sail. Extending the model would require measurements at several heights and an account of the interaction between those sections.

Within these assumptions, we have obtained $C_L (alpha)=(8pi R/c)sin(alpha+delta+beta)$. Beginning with a circle allowed us to construct a flow which followed its boundary. The Joukowski transformation then gave us an airfoil, and the Kutta condition determined the circulation needed for a finite trailing-edge velocity. Integrating the resulting pressure gave the lift. For the chosen section, this predicts $C_L approx 1.195$ at $5 degree$ and explains how both camber and angle of attack affect the force. It provides a mathematical model of an idealized sail section, with measured geometry and more complete flow assumptions still needed to determine the lift coefficient of an actual ILCA 7 sail.

