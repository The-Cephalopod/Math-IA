#import "../template.typ": *
#counter(page).update(1) 
#set page(numbering: "1", number-align: top+right, margin: 2.5cm)

It is well known from qualitative experience that sailboats can move forward even while travelling into the wind. Sailboats can be broken down into 2 primary rigid components: the sail and the daggerboard. We can think of these components as foils. An example of the cross-section of a foil is shown in _fig. 2_. The perspective shown by _fig. 2_ is representative of a top-down view of a sail, or daggerboard.

#image("../Resources/betterairfoildiagram.png")

Figure 2: Airfoil Diagram. Adapted from @Kapania2008Modeling.

For the purposes of this paper, we will assume fluids are "perfect" in that they are inviscid, meaning that they have no viscosity, are incompressible such that their density remains constant, are continuous such that they are not made up of discreet particles but rather one fluid continuum, and flow steadily (without changes in their properties over time [10]) in a 2-dimensional field.

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

This sectional lift coefficient serves as an idealized representation of the ILCA 7 sail [10].

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

$ e^(i x)=lim_(n->infinity)(1+(i x)/n)^n $
$ |zeta z|=|zeta|dot|z| $
$ arg(z zeta) = arg(z) + arg(zeta) $
$ |z^n|=|z|^n $
$ arg(z^n) = n arg(z) $

Now let's consider the case that $1+(i x)/n$ from (32) is the complex number $z=a + b i$ where $a=1$ and $b=x/n$. This means

$ |1+(i x)/n| = sqrt(1+ (x^2)/(n^2)) $

and

$ tan(arg(1+(i x)/n)) = x/n $

Using (32), (35), and (38):
$ |e^(i x)|=lim_(n->infinity)|1+(i x)/n|^n $
$ |e^(i x)|=lim_(n->infinity)(1+(x^2)/(n^2))^(n/2) $
$ |e^(i x)|=lim_(n->infinity)(1+(x^2)/(n^2))^((n^2)/(2n)) $
$ |e^(i x)|=lim_(n->infinity)e^((x^2)/(2n)) $
$ |e^(i x)|=1 $

This means that $e^(i x)$ has magnitude 1.

The proof that $lim_(x->0) tan(x)/x =1$ is trivial, so it will be assumed. Using this:

$ arg(e^(i x)) = lim_(n->infinity) n arg(1+(i x)/n) $
$ arg(e^(i x)) = lim_(n->infinity) n arg(1+(i x)/n) tan(arg(1+(i x)/n))/arg(1+(i x)/n) $
$ arg(e^(i x)) = lim_(n-?infinity) (n x)/n $
$ arg(e^(i x)) = x $

Therefore, using (43) and (47):

$ e^(i x) = cos(x) + i sin(x) $ <euler>

By substituting $x$ for $theta$, we have shown that $z = e^(i theta_z)$ is a point that lies on the complex unit circle.

As $t$ increases from $0$ to $2pi$, (48) traces the circle once counterclockwise. Multiplication by a radius $R>0$ enlarges it and addition of a centre $z_0=h+i k$ translates it:

$ z(t)=z_0+R e^(i t)=(h+R cos t)+i(k+R sin t), quad 0<=t<=2pi. $ <circle>

To create an airfoil from this complex unit circle, we will use conformal mapping. Conformal mapping is used to map one plane to another while preserving the angles between the tangent lines of intersecting, parameterized smooth curves in either plane. Complex functions can be mapped conformally if the function is analytic and its derivative at any conformally mapped point is nonzero. A function being "analytic" means that if we let $f: A->CC$ where $A subset CC$ is an open set (a set which does not include its boundary points), then $f$ must be differentiable at every point $z_0 in A$.

We previously defined the complex numbers $z = a + i b$ and $zeta = xi + i eta$. Now let's consider these same complex numbers to represent two planes. We will map the plane containing the unit circle $z = a + i b$ to the plane $zeta = xi + i eta$ to transform the unit circle into a foil.

We will begin this by first discussing complex differentiation. A complex function $f(z)$ is differentiable at a point $z_0$ if and only if the following limit difference quotient exists [11]:

$ f'(z_0) = lim_(z->z_0) (f(z)-f(z_0))/(z-z_0) $

Let $Delta z = z-z_0$

$ f'(z_0) = lim_(Delta z->0) (f(z_0+Delta z)-f(z_0))/(Delta z) $ <derivative>

If we drop the subscript from $z_0$ and let $Delta w = f(z_0+Delta z)-f(z_0)$, then $Delta w$ denotes a change in $f(z)$ corresponding to a change in $Delta z$ at the point at which $f$ is evaluated [11]. Therefore:

$ (d w)/(d z)=lim_(Delta z->0) (Delta w)/(Delta z) $

You might notice that the derivative (49) for a complex-valued function is identical in form to that of a real-valued function. However, for $f'(z_0)$ to exist, the relevant limit must exist independent of the direction from which $z$ approaches $z_0$.

Other than this difference, the definition in (49) means that complex numbers can be differentiated using the same rules applied to real numbers. 

An important requirement is that this limit must be the same along every approach to zero in the plane. For example, $f(z)=z^2$ gives the quotient $2z_0+Delta z$, which tends to $2z_0$ along every path. In contrast, for $f(z)=overline(z)$, the quotient is $overline(Delta z)/(Delta z)$. It is $1$ for real increments and $-1$ for purely imaginary increments, so this function has no complex derivative. Having two real coordinate functions is therefore not enough @Campuzano2019Complex.

The particular transformation I use is

$ zeta=f(z)=z+a^2/z, quad a>0, quad z!=0. $ <joukowski>

Here $a$ is a length scale, so both terms have units of length. To turn this rule into coordinate equations, I multiply $1/(x+i y)$ by $(x-i y)/(x-i y)$ to obtain real and imaginary parts:

$ zeta=x+i y+(a^2(x-i y))/(x^2+y^2), \
  xi=x(1+a^2/(x^2+y^2)), quad
  eta=y(1-a^2/(x^2+y^2)). $ <mapped-coordinates>

Differentiating $f(z)$ gives:

$ f'(z)=1-a^2/z^2, quad f''(z)=2a^2/z^3. $ <map-derivatives>

At $z=0$ the function is undefined; this is a singularity. At $z=plus.minus a$ it is defined but $f'(z)=0$; these are critical points. For the airfoils considered here, I will use $h<0$ and

$ R=|a-z_0|=sqrt((a-h)^2+k^2). $ <circle-radius>

The circle therefore passes through $z=a$, which maps to $zeta=2a$. The other critical point and the singularity lie strictly inside the circle because

$ R^2-|-a-z_0|^2=-4a h>0, quad
  R^2-|z_0|^2=a^2-2a h>0. $

A point is inside a circle when its distance to the centre is less than the radius. These inequalities therefore place both problematic points outside the fluid region, which consists only of the circle's exterior.

For a numerical example, I will use $h/a=-0.05$ and $k/a=0.10$. The horizontal offset gives this profile a rounded nose and small finite thickness; the vertical offset gives it camber. I express all geometric lengths in units of $a$. These ratios define an illustrative shape rather than a fit to an actual sail.

#figure(
  image("../Resources/joukowski_section.svg", width: 100%),
  caption: [The generating circle and mapped section in their respective planes. The chord is shown on the section.],
) <geometry-plot>

The chord must be measured from the mapped profile. For this rounded-nose family, the leading edge $zeta_L$ is the point farthest from the trailing edge $zeta_T=2a$. Therefore,  $g(t)=f(z(t))=xi(t)+i eta(t)$. Maximizing the distance is equivalent to maximizing its square, since squaring preserves the order of nonnegative numbers. Thus I maximize

$ H(t)=|g(t)-2a|^2=(xi(t)-2a)^2+eta(t)^2. $

This reduces the geometric problem to familiar single-variable optimization. The chain and product rules give

$ H'(t)=2(xi(t)-2a)xi'(t)+2eta(t)eta'(t). $

The same derivative can be written compactly in complex notation. Multiplying $(xi-2a-i eta)(xi'+i eta')$ shows that its real part is exactly $(xi-2a)xi'+eta eta'$. Also, differentiating @circle gives $z'(t)=i R e^(i t)$. Therefore the stationary-point condition is

$ H'(t)=2 op("Re")[overline(g(t)-2a)g'(t)]=0, quad
  g'(t)=f'(z(t))i R e^(i t). $ <nose-condition>

Numerically, I sample the interval $0<=t<=2pi$ to locate the largest values of $H$, then refine the root of $H'$ near that region and compare it with the other stationary points. The maximum is near $t=pi$; the trailing edge instead gives the zero-distance minimum. With

$ c=|zeta_T-zeta_L|, quad delta=arg(zeta_T-zeta_L), $

the chord length and its angle to the $xi$-axis are fixed. Numerical evaluation gives

$ R/a approx 1.054751, quad zeta_L/a approx -2.009174+0.001759i, \
  c/a approx 4.009174, quad delta approx -0.000438784. $ <geometry-values>

All angles are in radians unless a degree symbol is shown. The chord tilt is only about $-0.02514 degree$, but retaining it avoids treating the coordinate axis as the chord. I define $chi$ as the direction of the free-stream velocity relative to the positive $xi$-axis and choose the signed angle of attack so that

$ alpha=chi-delta, quad chi=alpha+delta. $ <incidence>

This fixes the sign convention used in the later circulation and lift calculations.

Now that the geometry is defined, I need a flow which passes around it. I will construct the flow around the circle first, then transfer it to the airfoil. This requires extending the differentiation and integration from Mathematics AA HL to quantities that depend on two coordinates.

At a point $(x,y)$ in the circle plane, write the air velocity as $bold(V)_z(x,y)=(u_z(x,y),v_z(x,y))$. Such an assignment of a vector to each point is called a *vector field*. The subscript $z$ identifies the circle plane; it does not indicate differentiation. Steady flow means this field does not change with time at a fixed position. Its value can still change from one position to another.

For a function of one variable, its derivative measures the change in its output when its input changes. If a scalar function $S(x,y)$ has two inputs, I can first hold $y$ fixed and change only $x$. This defines the *partial derivative*

$ S_x(x,y)=frac(partial S,partial x)
  =lim_(epsilon->0)frac(S(x+epsilon,y)-S(x,y),epsilon). $ <partial-x>

Similarly, holding $x$ fixed gives

$ S_y(x,y)=frac(partial S,partial y)
  =lim_(epsilon->0)frac(S(x,y+epsilon)-S(x,y),epsilon). $ <partial-y>

Thus the symbol $partial$ records which input is varying; the actual calculation uses ordinary differentiation. For a dimensionless example, let $S(x,y)=x^2 y+3y^2$. Treating $y$ as a constant gives $S_x=2x y$, whereas treating $x$ as a constant gives $S_y=x^2+6y$. At $(1,2)$ these are $4$ and $13$: the rate of change depends on the direction in which I move. These definitions extend single-variable differentiation to functions of several variables.

I can differentiate again. The notation $S_(x x)=partial^2 S/partial x^2$ means differentiating twice with respect to $x$; it does not mean squaring $S_x$. For the example, $S_(x x)=2y$ and $S_(y y)=6$. A *mixed derivative* changes the variable between the two differentiations: differentiating $S_x$ with respect to $y$ gives $2x$, as does differentiating $S_y$ with respect to $x$. These two orders agree when the second partial derivatives are continuous near the point. The functions used below have this smoothness everywhere in the fluid region where they are evaluated.

When both inputs change, their first-order contributions add:

$ Delta S approx S_x Delta x+S_y Delta y. $

This follows by splitting the movement into an $x$-step and a $y$-step and using the one-variable tangent approximation on each. Continuity of the partial derivatives makes the error small compared with the total displacement as the steps shrink. The corresponding *total differential* is

$ d S=S_x d x+S_y d y. $ <total-differential>

If a curve is parameterized by $(x(t),y(t))$, both coordinates now depend on the single variable $t$. Substituting $d x=x'(t)d t$ and $d y=y'(t)d t$ gives the chain rule along that curve:

$ frac(d S(x(t),y(t)),d t)=S_x x'(t)+S_y y'(t). $ <two-variable-chain>

The two terms represent the two ways that changing $t$ changes $S$. This is the multivariable version of the chain rule. For example, on $(x(t),y(t))=(t,2t)$, the previous function becomes $S=2t^3+12t^2$. Direct differentiation gives $6t^2+24t$. The right side of @two-variable-chain gives $(4t^2)(1)+(t^2+12t)(2)$, the same result.

Incompressibility means that a small fixed region cannot continually lose or gain fluid volume. Consider a rectangle of width $Delta x$ and height $Delta y$, per unit span. Its approximate net outward flow through its left and right sides is

$ [u_z(x+Delta x,y)-u_z(x,y)]Delta y
  approx frac(partial u_z,partial x)Delta x Delta y. $

The top and bottom sides similarly contribute $(partial v_z/partial y)Delta x Delta y$. Dividing their sum by the area and letting the rectangle shrink gives

$ frac(partial u_z,partial x)+frac(partial v_z,partial y)=0. $ <incompressibility>

The expression on the left is the two-dimensional *divergence*: it measures local net outflow per unit area. Its zero value expresses conservation of fluid in this model.

The other assumption, irrotationality, concerns local turning, rather than net outflow. A small horizontal material segment has an angular turning rate approximately $partial v_z/partial x$; a small vertical segment has an angular turning rate approximately $-partial u_z/partial y$. Their average describes the local rotation of a small fluid element. Thus the quantity

$ omega=frac(partial v_z,partial x)-frac(partial u_z,partial y) $ <vorticity>

is twice this angular rate and is called the two-dimensional *vorticity*, or the out-of-plane component of curl. Irrotational flow has $omega=0$. Curved particle paths alone do not imply nonzero vorticity: this condition describes the rotation of a small element about itself.

To construct such a field, I seek a real-valued *velocity potential* $phi(x,y)$ satisfying

$ u_z=phi_x, quad v_z=phi_y. $ <velocity-potential>

The vector $(phi_x,phi_y)$ is called the *gradient* of $phi$. The potential has units $"m"^2 "s"^(-1)$, so its spatial derivatives have velocity units. It generalizes the idea of finding an antiderivative: instead of one derivative recovering one function, two partial derivatives recover the two velocity components. It is not the pressure or the speed itself. Adding a constant to $phi$ leaves the velocities unchanged.

This construction guarantees irrotationality because $partial v_z/partial x=partial phi_y/partial x$ and $partial u_z/partial y=partial phi_x/partial y$ are equal mixed derivatives. A sufficiently smooth irrotational field has such a potential locally; I will explicitly construct one, rather than rely on a global existence claim. Substituting @velocity-potential into @incompressibility gives

$ frac(partial^2 phi,partial x^2)+frac(partial^2 phi,partial y^2)=0. $ <laplace>

This is *Laplace's equation*. It is a partial differential equation: an equation specifying how an unknown function's partial derivatives are related. A function satisfying it is called *harmonic*. Its importance here is that its solutions can be added. If $phi_1$ and $phi_2$ satisfy @laplace, then for constants $A$ and $B$,

$ frac(partial^2(A phi_1+B phi_2),partial x^2)+frac(partial^2(A phi_1+B phi_2),partial y^2) \
  =A(frac(partial^2 phi_1,partial x^2)+frac(partial^2 phi_1,partial y^2))
  +B(frac(partial^2 phi_2,partial x^2)+frac(partial^2 phi_2,partial y^2))=0. $

This property is called *linearity*. It lets me build the required flow from simpler flows, while still checking that their sum satisfies the required boundary conditions.

A *streamline* is a curve whose tangent follows the local velocity. To describe these curves, I introduce a second real function, the *stream function* $psi$, defined by

$ psi_x=-v_z, quad psi_y=u_z. $ <stream-definition>

These assignments are compatible with equality of mixed derivatives precisely when @incompressibility holds. On a small region they therefore define $psi$ up to an additive constant. Its units, like those of $phi$, are $"m"^2 "s"^(-1)$. Applying @total-differential gives

$ d psi=-v_z d x+u_z d y. $ <stream-differential>

Along a streamline, the displacement $(d x,d y)$ is proportional to $(u_z,v_z)$, so the two terms cancel and $d psi=0$. Therefore $psi$ stays constant along a streamline. Conversely, a regular curve of constant $psi$ has its tangent parallel to the velocity. Making the circle boundary a curve of constant $psi$ will consequently prevent fluid from crossing it. A zero-velocity point also satisfies this no-penetration requirement.

I now combine the two real functions into one complex function:

$ W(z)=phi(x,y)+i psi(x,y), quad z=x+i y. $

This is the *complex potential*. To see why it is complex differentiable, first approach a point horizontally in the derivative's difference quotient. This gives $W'=phi_x+i psi_x$. Approaching vertically instead, the denominator is $i Delta y$, giving

$ W'=frac(phi_y+i psi_y,i)=psi_y-i phi_y. $

For these expressions to agree, the real and imaginary parts must agree:

$ phi_x=psi_y, quad phi_y=-psi_x. $ <cauchy-riemann>

These are the *Cauchy-Riemann equations*, already satisfied by @velocity-potential and @stream-definition. Checking just two directions would not prove that every direction works. Here the continuous partial derivatives supply that additional step: using @cauchy-riemann, the first-order change is

$ d W=(phi_x+i psi_x)d x+(phi_y+i psi_y)d y \
  =(phi_x+i psi_x)(d x+i d y). $

Dividing by $d z=d x+i d y$ gives the same derivative for any small displacement. The error tends to zero in the difference quotient, so $W$ is locally analytic. The connection between complex potentials and planar flow is developed in Olver's notes. @Olver2024Complex In particular,

$ W'(z)=phi_x+i psi_x=u_z-i v_z. $ <complex-velocity>

Thus a complex derivative stores two real velocities. The minus sign is essential: the vertical velocity is the negative of the imaginary part of $W'$. Its modulus is the speed, $|W'|=sqrt(u_z^2+v_z^2)$. The imaginary unit provides a compact representation; the physical velocities remain real.

Let $w=z-z_0$, so the boundary is $|w|=R$. Far away, the required constant velocity components are $U_infinity cos chi$ and $U_infinity sin chi$. By @complex-velocity the derivative of a suitable potential is therefore

$ U_infinity cos chi-i U_infinity sin chi=U_infinity e^(-i chi). $

Integrating with respect to $w$ gives $U_infinity e^(-i chi)w$, up to an irrelevant constant. This represents uniform flow, but by itself it passes through the circle. I need an additional analytic term that redirects flow near the circle while its velocity contribution tends to zero far away.

I try $A/w$, where $A$ is a complex constant to be chosen. Its derivative is $-A/w^2$, whose magnitude decreases as $1/|w|^2$. Such a reciprocal-potential contribution is called a *doublet*. For this exploration its role can be verified directly from the boundary, without introducing the source-and-sink construction sometimes used to obtain it. With

$ W_0=U_infinity e^(-i chi)w+A/w, $

substitution of $w=R e^(i theta)$ gives

$ W_0=U_infinity R e^(i(theta-chi))+(A/R)e^(-i theta). $

Choosing $A=U_infinity R^2 e^(i chi)$ makes the second term the complex conjugate of the first. Their sum is $2U_infinity R cos(theta-chi)$, which is real. Its imaginary part, $psi$, is consequently zero at every boundary point. The resulting potential is

$ W_0(z)=U_infinity(e^(-i chi)w+(R^2 e^(i chi))/w). $ <circle-potential>

It satisfies both requirements: no flow through the circle and the specified uniform flow at large distance. The singularity at $w=0$ lies inside the excluded obstacle. This is a particular case of the circle theorem, but the boundary calculation above verifies the case I need directly. @Campuzano2019Complex

An integral $integral_b^d F(t)d t$ can be understood as the limit of sums $sum_j F(t_j^*)Delta t_j$ as the subinterval widths approach zero. A *line integral* uses the same idea, but the small contributions are distributed along a curve. Here “line” includes curved paths.

Let $C$ be parameterized by $bold(r)(t)=(x(t),y(t))$ for $t_0<=t<=t_1$. A small change $Delta t$ gives a displacement approximately $(x'(t),y'(t))Delta t$. By Pythagoras, its length is approximately $sqrt(x'(t)^2+y'(t)^2)Delta t$. In the limit, the arc-length element is

$ d s=sqrt(x'(t)^2+y'(t)^2)d t. $ <arc-length-element>

Consequently, adding a scalar quantity $B$ per unit length along the curve gives

$ integral_C B d s
  =integral_(t_0)^(t_1) B(x(t),y(t))sqrt(x'(t)^2+y'(t)^2)d t. $ <scalar-line-integral>

For example, $B=1$ gives the curve's length. For a circle $(x,y)=(h+R cos t,k+R sin t)$, the square root is $R$, so the integral is $integral_0^(2pi) R d t=2pi R$. This recovers the familiar circumference using ordinary integration.

For circulation I need the velocity component *along* the curve. If $bold(T)$ is the unit tangent in the direction of travel, the dot product $bold(V)_z dot bold(T)$ gives that signed component. Since $bold(T)d s=d bold(r)$, the sum of these tangential contributions is

$ integral_C bold(V)_z dot d bold(r)
  =integral_C(u_z d x+v_z d y) \
  =integral_(t_0)^(t_1)[u_z(x(t),y(t))x'(t)+v_z(x(t),y(t))y'(t)]d t. $ <vector-line-integral>

This follows by taking the limit of the sums $sum_j(u_z Delta x_j+v_z Delta y_j)$. A vector line integral therefore reduces to a definite integral in the parameter. Unlike $integral_C B d s$, it changes sign when the direction around the curve is reversed. These are the scalar and vector forms of line integration.

If the path returns to its starting point, I use the closed-integral symbol $integral.cont_C$. The velocity integral around such a path is called *circulation*, with units $"m"^2 "s"^(-1)$. For consistency with positive lift later, I define $Gamma$ to be positive for clockwise circulation, while $C$ itself is traversed counterclockwise:

$ Gamma=-integral.cont_C(u_z d x+v_z d y). $ <circulation>

This minus sign is a convention, not an additional physical assumption. As a check, a uniform flow has zero circulation: its integral is $u_z integral.cont_C d x+v_z integral.cont_C d y=0$, since the net changes in both coordinates are zero. More generally, for a single-valued potential on the entire closed path, @two-variable-chain gives

$ integral.cont_C(u_z d x+v_z d y)
  =integral_(t_0)^(t_1)frac(d phi(x(t),y(t)),d t)d t \
  =phi(x(t_1),y(t_1))-phi(x(t_0),y(t_0))=0. $

This is the fundamental theorem of calculus applied to the parameterized path. In particular, the uniform-plus-doublet potential @circle-potential has zero circulation.

I can add a flow which moves tangentially around the circle. At distance $r=|w|$, consider the counterclockwise tangential velocity component $-Gamma/(2pi r)$. The minus sign makes the motion clockwise for positive $Gamma$. Because the counterclockwise unit tangent is $(-sin theta,cos theta)$, the Cartesian components of this additional field are

$ u_"vortex"=frac(Gamma sin theta,2pi r), quad
  v_"vortex"=-frac(Gamma cos theta,2pi r). $ <vortex-velocities>

I can check its circulation on any circle of radius $r>R$. Here $d x=-r sin theta d theta$ and $d y=r cos theta d theta$, so

$ integral.cont_C(u_"vortex" d x+v_"vortex" d y) \
  =-frac(Gamma,2pi)integral_0^(2pi)(sin^2 theta+cos^2 theta)d theta=-Gamma. $

It therefore contributes exactly the clockwise circulation required by @circulation, independent of the chosen radius. Also, @vortex-velocities gives

$ u_"vortex"-i v_"vortex"
  =frac(i Gamma e^(-i theta),2pi r)=frac(i Gamma,2pi w). $

The real antiderivative of $1/x$ suggests a logarithm. To use the exponential at a general complex input, I extend Euler's formula by defining $e^(X+i Y)=e^X(cos Y+i sin Y)$. The real and imaginary parts have derivatives $A_X=e^X cos Y=B_Y$ and $A_Y=-e^X sin Y=-B_X$. They therefore satisfy the Cauchy-Riemann equations, and the complex derivative is $A_X+i B_X=e^(X+i Y)$, just as for the real exponential. For a complex number $w/R=(r/R)e^(i theta)$, define a local complex logarithm by

$ op("Log")(w/R)=ln(r/R)+i theta. $ <complex-logarithm>

Exponentiating the right side returns $w/R$, so this is the complex counterpart of the inverse relationship between $ln$ and the exponential. Implicit differentiation of $e^(op("Log")(w/R))=w/R$ gives $(d/(d w))op("Log")(w/R)=1/w$. The required additional potential is therefore $(i Gamma/(2pi))op("Log")(w/R)$. This standard vortex potential is described by Campuzano; my clockwise convention gives the opposite sign to a counterclockwise-positive convention. @Campuzano2019Complex

The word “local” matters. An angle can be written as $theta+2pi n$ for any integer $n$. A *branch* chooses a continuous value of the angle on a region which does not go all the way around the centre. After one counterclockwise circuit, a continuously followed angle increases by $2pi$, so the logarithm increases by $2pi i$. The derivative $1/w$, however, returns to the same value.

For the vortex term, the real and imaginary parts are $phi_"vortex"=-Gamma theta/(2pi)$ and $psi_"vortex"=Gamma ln(r/R)/(2pi)$. The potential thus changes by $-Gamma$ after a circuit; it is not a single-valued potential on the whole exterior. This is why the preceding zero-circulation argument does not apply. The velocity itself is single-valued and locally irrotational everywhere in the fluid. The excluded centre is essential: a loop surrounding the obstacle cannot be shrunk to a point while staying in the fluid.

Adding this term to @circle-potential gives

$ W(z)=U_infinity(e^(-i chi)w+(R^2 e^(i chi))/w)
  +frac(i Gamma,2pi)op("Log")(w/R). $ <full-potential>

Taking the imaginary part after substituting $w=r e^(i theta)$ gives

$ psi(r,theta)=U_infinity(r-R^2/r)sin(theta-chi)
  +frac(Gamma,2pi)ln(r/R). $ <stream-function>

At $r=R$, both terms are zero. The vortex velocity also tends to zero as $r$ increases. Thus every value of $Gamma$ satisfies the same no-penetration and far-field conditions. The vortex term describes the flow's circulation; it does not imply that the sail itself rotates. An additional physical condition will be needed to select $Gamma$.

The Joukowski map sends $z$ to $zeta=f(z)$. To assign a potential to a point $zeta$ outside the airfoil, I first find its corresponding exterior point $z=f^(-1)(zeta)$, then evaluate $W$ there:

$ tilde(W)(zeta)=W(f^(-1)(zeta)). $

The inverse here means the continuous exterior solution; the algebraic mapping need not have a unique inverse over the entire complex plane. Locally in the exterior, $f'(z)!=0$. The derivative of the inverse can be understood directly by reversing the difference quotient:

$ (Delta z)/(Delta zeta)
  =frac(1,(f(z+Delta z)-f(z))/(Delta z))->1/f'(z). $

Here I follow the local exterior inverse, so $Delta zeta->0$ also gives $Delta z->0$. The nonzero derivative allows me to take the reciprocal limit. Thus $d z/d zeta=1/f'(z)$, the same inverse-derivative rule as in real calculus. Applying the chain rule to $W(z(zeta))$ then gives the mapped complex velocity

$ q(zeta)=u-i v=frac(d tilde(W),d zeta)
  =frac(W'(z),f'(z)) \
  =frac(U_infinity(e^(-i chi)-(R^2 e^(i chi))/w^2)+(i Gamma)/(2pi w),1-a^2/z^2). $ <mapped-velocity>

The identity $q d zeta=W'(z)d z$ also shows that the circulation is preserved: taking real parts gives $u d xi+v d eta=u_z d x+v_z d y$, so corresponding closed paths have the same circulation integral. Thus $Gamma$ retains its meaning after mapping.

This is the same composition rule used for real derivatives, now applied to complex differentiable functions. The transformed potential is locally analytic, so its real and imaginary parts obey the same Cauchy-Riemann relations as before. Taking mixed derivatives in those relations gives Laplace's equation, while @complex-velocity supplies the incompressible, irrotational velocity field. The boundary also remains a streamline: its value of $psi$ is still zero at the corresponding points.

The division by $f'(z)$ has a geometric meaning. Where the map stretches a small displacement by $|f'(z)|$, the speed is divided by that factor. Simply moving the circle's velocity arrows to the new boundary would therefore give incorrect speeds. As $|z|$ grows, $f'(z)=1-a^2/z^2$ tends to $1$, so the undisturbed speed and direction stay $U_infinity$ and $chi$.

At the trailing-edge preimage $z=a$, the denominator of @mapped-velocity is zero. Unless its numerator also vanishes, the quotient predicts an unbounded speed. The *Kutta condition* selects the flow which leaves a sharp trailing edge smoothly with finite velocity. It is an additional physical condition imposed on the inviscid model. At a cusped edge, such as this one, the limiting surface velocities meet with a common finite value. MIT's discussion distinguishes this from the condition at an edge with a finite angle. @Darmofal2005Kutta

To impose it, I write the radius from the circle centre to the trailing-edge preimage as

$ a-z_0=R e^(-i beta), quad beta=arctan(k/(a-h)). $ <beta>

Since $a-h>0$, the inverse tangent identifies the correct angle: the vector has real part $a-h$ and imaginary part $-k$. Substitution into the numerator gives

$ W'(a)=U_infinity(e^(-i chi)-e^(i chi+2i beta))
  +frac(i Gamma e^(i beta),2pi R). $

To simplify the two exponential terms, factor out $e^(i beta)$. The remaining difference is $e^(-i(chi+beta))-e^(i(chi+beta))=-2i sin(chi+beta)$, using Euler's formula. Therefore

$ W'(a)=i e^(i beta)[-2U_infinity sin(chi+beta)+Gamma/(2pi R)]. $ <kutta-numerator>

The factor $i e^(i beta)$ is nonzero, so $W'(a)=0$ requires the expression in square brackets to be zero. Solving gives

$ Gamma=4pi R U_infinity sin(chi+beta)
  =4pi R U_infinity sin(alpha+delta+beta). $ <selected-circulation>

The geometry and angle of attack have now selected one circulation. However, making numerator and denominator zero is not by itself sufficient to establish a finite quotient. I must compare how quickly they approach zero.

The definition of a derivative gives, for a small nonzero complex increment $epsilon$,

$ W'(a+epsilon)=W'(a)+epsilon[W''(a)+r_1(epsilon)], \
  f'(a+epsilon)=f'(a)+epsilon[f''(a)+r_2(epsilon)], $

where both error terms $r_1(epsilon)$ and $r_2(epsilon)$ tend to zero. With the selected circulation, $W'(a)=f'(a)=0$, so the common factor $epsilon$ cancels. Since $f''(a)=2/a!=0$, the denominator of the remaining quotient tends to a nonzero number. Thus

$ q_T=lim_(z->a)frac(W'(z),f'(z))=frac(W''(a),f''(a)), \
  W''(z)=frac(2U_infinity R^2 e^(i chi),w^3)-frac(i Gamma,2pi w^2). $ <trailing-limit>

Both derivatives on the right are finite because $a-z_0!=0$. This justifies the finite limit using the same local linear approximation that underlies ordinary differentiation. A zero circle-plane velocity at $z=a$ need not give zero airfoil-plane velocity: the mapping derivative vanishes at the same point, and their ratio is what determines the physical speed.

To calculate the force, I must relate the velocity field to pressure. Pressure $p$ is force per unit area. Consider a short fluid element of cross-sectional area $A$ and length $d s$ along a streamline in the horizontal plane of my section. If the pressure rises by $d p$ along it, the net tangential pressure force is approximately $-A d p$. Its mass is $rho A d s$. Viscosity is neglected, so there is no tangential friction force in this model.

Write $V$ for the speed along the streamline and $tau$ for physical time. Although the field is steady, a moving particle can accelerate because it reaches positions where the speed is different. The chain rule gives

$ (d V)/(d tau)=(d V)/(d s)(d s)/(d tau)=V(d V)/(d s). $ <streamline-acceleration>

Newton's second law therefore gives $-A d p=rho A d s V(d V)/(d s)$, or $d p=-rho V d V$. Density is constant, so ordinary integration between the undisturbed flow and a chosen point gives

$ integral_(p_infinity)^p d P=-rho integral_(U_infinity)^V v d v
  =-frac(1,2)rho(V^2-U_infinity^2). $ <bernoulli-integration>

Here $P$ and $v$ are only integration variables. Rearranging produces the horizontal form of Bernoulli's equation. In the mapped plane $q=u-i v$, so the speed is $V=sqrt(u^2+v^2)=|q|$. Thus

$ p+frac(1,2)rho V^2=p_infinity+frac(1,2)rho U_infinity^2, \
  C_p=(p-p_infinity)/(frac(1,2)rho U_infinity^2)=1-frac(abs(q)^2,U_infinity^2). $ <pressure>

The pressure coefficient $C_p$ measures pressure relative to the undisturbed value, on the scale $rho U_infinity^2/2$. For example, $V=U_infinity$ gives $C_p=0$, a stagnation point ($V=0$) gives $C_p=1$, and $V=2U_infinity$ gives $C_p=-3$. A negative coefficient means pressure below $p_infinity$, not negative absolute pressure. The pressure-speed relationship is a consequence of the inviscid energy balance.
Integration along one streamline initially gives a constant for that streamline. Why can I use the same constant throughout this flow? Along a moving particle, the multivariable chain rule gives $d u/d tau=u u_xi+v u_eta$, since $d xi/d tau=u$ and $d eta/d tau=v$. The net horizontal pressure force per unit volume is $-p_xi$, so the horizontal component of the same force balance is $p_xi=-rho(u u_xi+v u_eta)$. Irrotationality gives $u_eta=v_xi$, so

$ partial/(partial xi)[p+frac(1,2)rho(u^2+v^2)]
  =-rho(u u_xi+v u_eta)+rho(u u_xi+v v_xi)=0. $

The corresponding derivative with respect to $eta$ is also zero. The expression is therefore constant throughout the connected fluid region, and its far-field value fixes the constant in @pressure. This is where the irrotational assumption is used in applying Bernoulli across streamlines. @Yue2005Marine There is no assumption that air particles taking different routes around the section must meet again at the trailing edge.

For the pressure plot, I measure position along the chord from the leading edge. If $zeta_L=xi_L+i eta_L$, this projected distance is $X=(xi-xi_L)cos delta+(eta-eta_L)sin delta$, the dot product with the chord's unit direction. The horizontal axis is $X/c$, so $0$ marks the leading edge and $1$ the trailing edge. I trace the two boundary arcs joining those edges separately to obtain the upper- and lower-surface curves.

#figure(
  image("../Resources/pressure_coefficients.svg", width: 100%),
  caption: [Surface pressure coefficients for the illustrative section at $alpha=5 degree$. Negative coefficients are plotted upward. The curves are calculated from @mapped-velocity and @pressure.],
) <pressure-plot>

The lower pressure over much of the upper surface in @pressure-plot suggests a resultant force toward that side. I now need to add the pressure forces on all boundary elements. This uses the line-integral idea already developed for circulation, but the force acts *normal* to the surface, rather than along it.

Let the airfoil boundary $C$ be traced counterclockwise by $zeta(t)=xi(t)+i eta(t)$. For a short parameter interval $Delta t$, the displacement is approximately $(xi'(t),eta'(t))Delta t$. Pythagoras gives its length:

$ Delta s approx sqrt(xi'(t)^2+eta'(t)^2)Delta t,
  quad d s=sqrt(xi'(t)^2+eta'(t)^2)d t. $ <pressure-arc-length>

This is the arc-length element: the familiar sum of short straight lengths approaches the length of the curve. Dividing the tangent vector by its magnitude gives a unit tangent. A clockwise $90 degree$ rotation of $(a,b)$ is $(b,-a)$; for a counterclockwise boundary this rotation points outward. Hence, at a regular boundary point,

$ bold(n)=frac((eta'(t),-xi'(t)),sqrt(xi'(t)^2+eta'(t)^2)),
  quad bold(n)d s=(d eta,-d xi). $ <outward-normal>

For example, at the right-hand side of a counterclockwise circle the tangent points upward, so this normal points right, away from the body. This checks the sign. At the cusp I use the limiting boundary values from each side; one point has no finite arc length to contribute separately.

For a strip of span $b$, a small surface patch has area $b d s$. Its pressure force is $-p bold(n)b d s$, with the minus sign because pressure pushes into the body. Dividing by $b$ leaves the force *per unit span*, $d bold(F)=-p bold(n)d s$. Adding these contributions and taking the limit gives

$ F_xi=-integral.cont_C p d eta, quad F_eta=integral.cont_C p d xi. $ <pressure-force>

For instance, the first component means the ordinary parameter integral

$ F_xi=-integral_0^(2pi) p(xi(t),eta(t))eta'(t)d t. $ <pressure-parameter>

The units are pressure times length, $"N m"^(-2) times "m"="N m"^(-1)$, as required. Replacing $p$ by $p-p_infinity$ changes neither component: by the fundamental theorem of calculus, $integral.cont_C d eta=eta(2pi)-eta(0)=0$ and $integral.cont_C d xi=0$. Uniform pressure cancels around a closed body, even when its outline is curved.

To simplify the two force components together, I will use a *complex contour integral*. This adds no new integration operation. If $G(zeta)=A(xi,eta)+i B(xi,eta)$, define

$ integral_C G(zeta)d zeta
  =integral_(t_0)^(t_1)G(zeta(t))zeta'(t)d t \
  =integral_C(A d xi-B d eta)+i integral_C(B d xi+A d eta). $ <complex-integral-definition>

The second line follows by multiplying $(A+i B)(d xi+i d eta)$ and using $i^2=-1$. Each component is a real line integral with the parameter interpretation already established. The symbol $integral.cont$ indicates that the curve is closed. In particular, $d overline(zeta)=d xi-i d eta$, since complex conjugation reverses the sign of the imaginary part.

Representing the force by $F_xi-i F_eta$ and combining @pressure-force gives

$ F_xi-i F_eta=-i integral.cont_C p d overline(zeta). $ <complex-pressure-force>

The constant-pressure term vanishes as above, and @pressure then gives

$ F_xi-i F_eta=(i rho)/2 integral.cont_C |q|^2 d overline(zeta). $ <force-step>

There is one more useful simplification. On the impermeable boundary $psi$ is constant, so the change $d tilde(W)=d phi+i d psi$ is real. By the chain rule it also equals $q d zeta$. A real number equals its complex conjugate, hence

$ q d zeta=overline(q)d overline(zeta),
  quad q^2 d zeta=q overline(q)d overline(zeta)=|q|^2 d overline(zeta). $

Substituting this identity into @force-step produces

$ F_xi-i F_eta=(i rho)/2 integral.cont_C q(zeta)^2 d zeta. $ <blasius>

This is Blasius' force formula. @Olver2024Complex I have derived the form and signs needed here from pressure acting on small surface elements. Its use depends on the boundary being a streamline; it is not a general identity for arbitrary curves carrying arbitrary velocity fields.

Directly integrating @blasius around the airfoil is awkward. Far from the airfoil, however, the velocity is almost uniform. I need to justify replacing its boundary by a large circle. The result I use is *contour deformation*: if $G$ is analytic throughout the region between two non-intersecting closed curves, its integrals around those curves are equal when both are traversed counterclockwise. This does not say that either integral must be zero. @Campuzano2019Complex

To understand where this result comes from, I first extend the fundamental theorem of calculus, $integral_a^b F'(x)d x=F(b)-F(a)$, to a small rectangle. Suppose $P(x,y)$ and $Q(x,y)$ have continuous first partial derivatives. On the counterclockwise rectangle $[a,b] times [c,d]$, the horizontal edges contribute

$ integral_a^b[P(x,c)-P(x,d)]d x
  =-integral_a^b integral_c^d P_y(x,y)d y d x. $

The inner integral simply holds $x$ fixed and applies the fundamental theorem in $y$; the outer integral then adds those results along $x$. Similarly, the two vertical edges contribute

$ integral_c^d[Q(b,y)-Q(a,y)]d y
  =integral_c^d integral_a^b Q_x(x,y)d x d y. $

Together these give $integral.cont(P d x+Q d y)=integral.double(Q_x-P_y)d A$. Here the double integral means the limit of sums $(Q_x-P_y)Delta A$ over small area pieces, and $d A$ denotes an area element. On a rectangle it can be calculated by the repeated ordinary integrations above; continuity permits either integration order.

For a region assembled from adjacent rectangles, contributions on their shared edges cancel because one rectangle follows an edge in the opposite direction to its neighbour. Taking finer partitions leads to *Green's theorem*: the integral around the remaining boundary equals the area integral of $Q_x-P_y$. This explains the mechanism rather than providing the full limiting proof for every possible boundary. I use the theorem for bounded regions with piecewise smooth boundaries and continuously differentiable fields. It also applies to a region containing a hole: the outer boundary is counterclockwise and the boundary around the hole is clockwise.

Now put $G=A+i B$ in @complex-integral-definition, using the coordinates $xi,eta$. The real line integral has $P=A,Q=-B$, so its Green integrand is $-B_xi-A_eta$. The imaginary one has $P=B,Q=A$, so its integrand is $A_xi-B_eta$. Since $G$ is analytic, the Cauchy-Riemann equations give $A_xi=B_eta$ and $A_eta=-B_xi$. Both integrands are zero.

Applying this to the region between an outer circle $C_s$ and an inner curve $C_0$ gives

$ 0=integral.cont_(C_s)G d zeta-integral.cont_(C_0)G d zeta,
  quad integral.cont_(C_0)G d zeta=integral.cont_(C_s)G d zeta. $ <contour-deformation>

The minus sign records the inner curve's opposite orientation as a boundary of this region. This is the needed form of Cauchy's theorem. For my application $G=q^2$ is analytic in the exterior fluid. I initially take $C_0$ just outside the airfoil and then let it approach the surface. The finite trailing-edge velocity established in @trailing-limit makes the boundary integral well defined in this limit. No analyticity inside the solid is required, and I do not move the contour through the solid or across a singularity.

I next need a controlled approximation far from the airfoil, rather than the complete velocity expression. I write $E(zeta)=O(1/zeta^2)$ to mean that there are positive constants $K,s_0$ such that $|E(zeta)|<=K/|zeta|^2$ whenever $|zeta|>s_0$. Thus this notation bounds the size of an omitted term; it does not mean the term is exactly zero. The bound is uniform in direction.

The terms in @mapped-velocity can be compared using ordinary algebra. Since $w=z-z_0$,

$ 1/(z-z_0)-1/z=z_0/(z(z-z_0))=O(1/z^2). $

The doublet velocity is also of order $1/z^2$. Moreover,

$ 1/(1-a^2/z^2)-1=(a^2/z^2)/(1-a^2/z^2)=O(1/z^2). $

So dividing by the mapping derivative changes the far-field velocity only at this smaller order. Finally, on the exterior inverse branch, $zeta-z=a^2/z$ and $zeta/z->1$ imply that $|z|$ and $|zeta|$ have the same leading size. In particular $1/z-1/zeta=a^2/(z^2 zeta)=O(1/zeta^3)$, so I can use $1/zeta$ in the leading reciprocal term. Therefore

$ q(zeta)=U_infinity e^(-i chi)+(i Gamma)/(2pi zeta)+O(1/zeta^2), \
  q(zeta)^2=U_infinity^2 e^(-2i chi)
  +(i U_infinity Gamma e^(-i chi))/(pi zeta)+O(1/zeta^2). $ <far-field>

The second expression follows from $(A+B)^2=A^2+2A B+B^2$: the square of a reciprocal term is of order $1/zeta^2$. This establishes the approximation needed for the integral without assuming a Laurent-series or residue formula.

Parameterize the large circle by $zeta=s e^(i t)$, $0<=t<=2pi$. A constant integrates to zero because $integral.cont d zeta=zeta(2pi)-zeta(0)=0$. For the reciprocal term,

$ integral.cont_(C_s)(d zeta)/zeta
  =integral_0^(2pi)(i s e^(i t))/(s e^(i t))d t
  =integral_0^(2pi)i d t=2pi i. $ <circle-integral>

For the remainder, the triangle inequality for a sum extends to its integral. Its absolute contribution is at most its maximum size times the path length:

$ abs(integral.cont_(C_s) E(zeta)d zeta)
  <=integral_0^(2pi)abs(E(s e^(i t)))s d t
  <=(K/s^2)(2pi s)=(2pi K)/s -> 0. $ <remainder-bound>

The factor $s$ is $|zeta'(t)|$, so the length of the integration path has been included. A small pointwise error alone would not be enough if the path length grew too quickly. Contour deformation says the integral has the same value for every sufficiently large $s$; taking $s->infinity$ therefore evaluates the exact integral around the body.

Only the reciprocal term survives. Substituting its value into @blasius gives

$ F_xi-i F_eta=(i rho)/2 ((i U_infinity Gamma e^(-i chi))/pi)(2pi i)
  =-i rho U_infinity Gamma e^(-i chi). $ <complex-force>

Since $e^(-i chi)=cos chi-i sin chi$, the real part is $-rho U_infinity Gamma sin chi$, and the negative of the imaginary part is $rho U_infinity Gamma cos chi$. Thus

$ (F_xi,F_eta)=rho U_infinity Gamma(-sin chi,cos chi). $ <force-vector>

The unit vector along the free stream is $(cos chi,sin chi)$. Its dot product with @force-vector is $rho U_infinity Gamma[-sin chi cos chi+cos chi sin chi]=0$, so this ideal model predicts zero drag. Rotating that unit vector $90 degree$ counterclockwise gives $(-sin chi,cos chi)$, which I use as the positive lift direction. The force component in that direction is

$ L'=(F_xi,F_eta) dot (-sin chi,cos chi)
  =rho U_infinity Gamma(sin^2 chi+cos^2 chi)
  =rho U_infinity Gamma. $ <kutta-joukowski>

This is the Kutta-Joukowski lift formula for my clockwise-positive circulation convention. The derivation connects the circulation chosen at the trailing edge to a net pressure force, using integration and vector projection.

Combining @selected-circulation, @kutta-joukowski and @cl-definition gives the result I set out to obtain:

$ L'=4pi rho R U_infinity^2 sin(alpha+delta+beta), quad
  C_l (alpha)=(8pi R)/c sin(alpha+delta+beta). $ <final-coefficient>

Here $R$, $beta$, $delta$ and $c$ are determined by the selected circle and its mapped section. The dependence on $rho$ and $U_infinity$ cancels in $C_l$. This is consistent with the definition: doubling $U_infinity$ multiplies the predicted dimensional lift by four, while the coefficient is unchanged at fixed geometry and incidence. Scaling every geometric length by the same positive factor also leaves $R/c$, $beta$ and $delta$ unchanged, so the ideal sectional coefficient is independent of absolute size.

For the chosen section, @geometry-values and @beta give $beta approx 0.094951706$ and $beta+delta approx 0.094512922$. The numerical coefficient is therefore

$ C_l (alpha) approx 6.612032 sin(alpha+0.094512922). $ <numerical-coefficient>

At $alpha=5 degree=5pi/180$, this predicts $C_l approx 1.195323$. This number describes the illustrative profile under the stated conditions. It does not establish the lift coefficient of a particular trimmed ILCA sail.

To check the calculation, I also evaluate @pressure-force numerically without using @kutta-joukowski. In @pressure-parameter, the variable of integration is the circle parameter $t$. Dividing $[0,2pi]$ into $N$ equal intervals gives $Delta t=2pi/N$. On each interval I approximate the integrand by its value at the midpoint and multiply by $Delta t$, exactly as in an ordinary midpoint Riemann sum. Increasing $N$ makes the boundary sampling finer. At midpoint values $t_j=2pi(j+1/2)/N$, for $j=0,dots,N-1$, define $p_j^*=p(t_j)-p_infinity$ from @pressure. The midpoint sums are

$ F_xi approx -(2pi)/N sum_(j=0)^(N-1)p_j^* eta'(t_j), quad
  F_eta approx (2pi)/N sum_(j=0)^(N-1)p_j^* xi'(t_j). $ <numerical-force>

The primes on $xi$ and $eta$ here mean derivatives with respect to $t$, whereas the prime on $L'$ means per unit span. Resolving these force sums perpendicular and parallel to the free stream gives $L'= -F_xi sin chi+F_eta cos chi$ and the drag per unit span $D'=F_xi cos chi+F_eta sin chi$. I divide each by $rho U_infinity^2 c/2$ to obtain the numerical $C_l$ and the drag coefficient $C_d$. Setting $a=U_infinity=rho=1$ merely chooses units for this dimensionless check. The following values were computed from the full mapped boundary; the calculation is reproduced in the accompanying `calculations.py` file.

#figure(
  table(
    align: center,
    columns: 3,
    [*$N$*], [*Numerical $C_l$*], [*Numerical $C_d$*],
    [32], [1.190231642], [$-3.3063 times 10^(-3)$],
    [64], [1.195496079], [$1.7163 times 10^(-4)$],
    [128], [1.195322877], [$4.0266 times 10^(-7)$],
    [256], [1.195322725], [$1.1736 times 10^(-12)$],
  ),
  caption: [Convergence of direct surface-pressure integration at $alpha=5 degree$. The analytical predictions are $C_l=1.195322725 dots$ and $C_d=0$.],
) <convergence-table>

The agreement in @convergence-table checks the transformation, force signs and normalization using a second calculation. It also shows how insufficient resolution can produce a small artificial drag. This is a check of the mathematics and numerical implementation; agreement between two calculations of the same ideal model does not validate its assumptions against real sailing conditions.

To investigate the dependence on angle, I keep $h/a=-0.05$ fixed and compare $k/a=0$, $0.05$ and $0.10$. Each circle's radius is recalculated using @circle-radius, and its chord and chord angle are recalculated using @nose-condition. Thus this comparison changes the profile geometry consistently. It does not hold thickness exactly constant while changing camber.

#figure(
  image("../Resources/lift_coefficients.svg", width: 100%),
  caption: [Predicted sectional lift coefficients for three generating-circle offsets. These compare ideal-flow solutions, not measured performance or a verified attached-flow operating range.],
) <lift-plot>

In @lift-plot the symmetric section, $k=0$, produces zero lift at zero incidence. Increasing the positive vertical offset moves the zero-lift crossing to a negative angle. From @final-coefficient, the zero nearest $alpha=0$ is

$ alpha_0=-(delta+beta). $ <zero-lift>

For the three profiles, the predicted zero-lift angles are $0 degree$, $-2.71391 degree$ and $-5.41519 degree$, respectively. The cambered example therefore has positive lift even when its chord is aligned with the flow. At the special incidence $alpha_0$, however, it has zero net lift despite its curved shape. This makes clear that camber alone does not guarantee lift at every angle; the circulation selected by the geometry and incidence is what enters @kutta-joukowski.

Differentiating @final-coefficient with respect to angle in radians gives

$ (d C_l)/(d alpha)=(8pi R)/c cos(alpha+delta+beta). $ <lift-slope>

For the chosen profile at $alpha=0$, this is about $6.58252$ per radian. If $alpha_d$ is the numerical angle in degrees, then $alpha=(pi/180)alpha_d$, so the chain rule multiplies the slope by $pi/180$, giving $0.114887$ per degree. A one-degree increase near this point therefore increases the model coefficient by approximately $0.115$. Close to the zero-lift angle, the tangent approximation $sin epsilon approx sin 0+epsilon cos 0=epsilon$ gives $sin(alpha-alpha_0) approx alpha-alpha_0$, giving the local linear approximation $C_l approx (8pi R/c)(alpha-alpha_0)$. This explains the nearly straight curves over the plotted interval.

There is also a useful limiting check. For an uncambered section with $k=0$ and $h$ approaching zero from below, $R->a$, $c->4a$ and $delta=beta=0$. Thus

$ C_l->2pi sin alpha approx 2pi alpha quad (|alpha| " small"). $ <thin-limit>

The small-angle result is the familiar thin-airfoil lift slope @Darmofal2005Thin. The exact flat-plate limit has a leading-edge singularity, so I use it as a limit of finite-thickness profiles and retain the rounded nose for the numerical pressure calculation. The lift slope of the chosen finite-thickness section is about $4.76%$ above $2pi$ near zero incidence. This difference is a consequence of the selected geometry, not a numerical error.

The mathematical formula would reach its positive maximum when $alpha+delta+beta=pi/2$. For the chosen section, this occurs near $84.58 degree$. It would be misleading to interpret that value as an optimal ILCA sail angle. The attached-flow model contains no mechanism for predicting stall or the changes in pressure caused by separation. The formal maximum is an example of the mathematics continuing beyond the physical assumptions that made the calculation possible.

The result also helps explain the daggerboard's role. For a chosen tack, let $theta_A$ be the angle between the bow and the direction from which the apparent wind arrives. Resolving positive aerodynamic lift and drag magnitudes into forward and leeward components gives

$ F_"forward"=L sin theta_A-D cos theta_A, quad
  F_"leeward"=L cos theta_A+D sin theta_A. $ <boat-forces>

Here $L$ and $D$ refer to the sail's resultant forces; the same projections can be applied per unit span. Small sideways motion, or leeway, produces an angle of attack on the daggerboard. Its hydrodynamic force provides lateral resistance, approximately balancing the sail's leeward force in steady sailing. The sail already has a forward force component. At constant speed this is balanced by water resistance; an excess forward force produces acceleration @Viola2011Sail. A full speed calculation would require the hull, daggerboard, sail variation with height, and their coupled dependence on boat motion. The present result establishes the sectional aerodynamic contribution.

Several limitations therefore remain when I relate this model to an ILCA 7. The Joukowski family restricts which profiles can be represented, and the chosen horizontal and vertical offsets have not been fitted to an actual sail. Even if a photographed section were fitted accurately, a real mainsail deforms as its loading and controls change. The mast also changes the leading-edge flow. Experimental sail-pressure research identifies separation and reattachment which are absent from this ideal model @Viola2011Sail. The zero drag found above is another consequence of the assumptions: real sails experience viscous and three-dimensional aerodynamic resistance.

Furthermore, the calculation treats a section as part of a two-dimensional flow. A real sail has finite height, a changing chord, twist, and variations in apparent wind. A single sectional coefficient cannot be multiplied by the entire sail area to obtain an exact total lift. Extending the work would first require measured section geometry and local incidence, followed by a treatment of the variation and interaction between sections. Experimental pressure or force measurements under matched conditions would then be needed to evaluate accuracy.

Within its assumptions, the exploration has produced the intended relationship, $C_l (alpha)=(8pi R/c)sin(alpha+delta+beta)$. The circle made it possible to satisfy the flow boundary condition explicitly. The transformation changed that simple geometry into a cambered foil, while its derivative determined the new velocity. The Kutta condition selected the circulation, and integrating the resulting pressure established a force perpendicular to the apparent wind. This is a mathematical derivation of lift for an idealized sail section, with the physical assumptions and the extra trailing-edge condition stated throughout.

For the illustrative profile, the derivation predicts positive lift at zero chord incidence, a zero-lift angle near $-5.42 degree$, and increasing lift over the small-angle interval considered. It gives a mathematical reason why adjusting a sail's angle changes the force I feel while sailing. It also clarifies what this explanation does not determine: the true coefficient of an ILCA sail, its stall angle, or the trim that makes the complete boat fastest. Those questions require additional geometry and fluid behaviour beyond the model developed here.
