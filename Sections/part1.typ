#import "../template.typ": *
#counter(page).update(1) 
#set page(numbering: "1", number-align: top+right, margin: 2.5cm)

It is well known from qualitative experience that sailboats can move forward even while travelling into the wind. Sailboats can be broken down into 2 primary rigid components: the sail and the centerboard. We can think of these components as foils. An example of the cross-section of a foil is shown in _fig. 2_. The perspective shown by _fig. 2_ is representative of a top-down view of a sail, or centerboard.

#image("../Resources/betterairfoildiagram.png")

Figure 2: Airfoil Diagram. Adapted from @Kapania2008Modeling.

For the purposes of this paper, we will assume fluids are "perfect" in that they are inviscid, meaning that they have no viscosity, are incompressible such that their density remains constant, are continuous such that they are not made up of discreet particles but rather one fluid continuum, and flow steadily (without changes in their properties over time [10]) in a 2-dimensional field.

The end goal of this paper is to be able to calculate the sectional lift coefficient of an ILCA 7 sail using the formula

$ C_L = L'/(1/2 rho U^2_infinity c) $
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

$ e^(i x) = cos(x) + i sin(x) $

By substituting $x$ for $theta$, we have shown that $z = e^(i theta_z)$ is a point that lies on the complex unit circle.

To create an airfoil from this complex unit circle, we will use conformal mapping. Conformal mapping is used to map one plane to another while preserving the angles between the tangent lines of intersecting, parameterized smooth curves in either plane. Complex functions can be mapped conformally if the function is analytic and its derivative at any conformally mapped point is nonzero. A function being "analytic" means that if we let $f: A->CC$ where $A subset CC$ is an open set (a set which does not include its boundary points), then $f$ must be differentiable at every point $z_0 in A$.

We previously defined the complex numbers $z = a + i b$ and $zeta = xi + i eta$. Now let's consider these same complex numbers to represent two planes. We will map the plane containing the unit circle $z = a + i b$ to the plane $zeta = xi + i eta$ to transform the unit circle into a foil.

We will begin this by first discussing complex differentiation. A complex function $f(z)$ is differentiable at a point $z_0$ if and only if the following limit difference quotient exists [11]:

$ f'(z_0) = lim_(z->z_0) (f(z)-f(z_0))/(z-z_0) $

Let $Delta z = z-z_0$

$ f'(z_0) = lim_(Delta z->0) (f(z_0+Delta z)-f(z_0))/(Delta z) $

If we drop the subscript from $z_0$ and let $Delta w = f(z_0+Delta z)-f(z_0)$, then $Delta w$ denotes a change in $f(z)$ corresponding to a change in $Delta z$ at the point at which $f$ is evaluated [11]. Therefore:

$ (d w)/(d z)=lim_(Delta z->0) (Delta w)/(Delta z) $

You might notice that the formula (49) for a complex-valued function is identical in form to that of a real-valued function. However, for $f'(z_0)$ to exist, the relevant limit must exist independent of the direction from which $z$ approaches $z_0$.

Other than this difference, the definition in (49) means that complex numbers can be differentiated using the same rules applied to real numbers. 

The type of conformal mapping we will use to create an airfoil is called the Joukowski transform, defined as:

$ zeta = f(z) = z + 1/z $

Here, $zeta$ is a function of the complex number $z$. We can then separate $zeta$ into its real and imaginary components:

$ x=a(1+xi^2/(a^2+b^2)) $
$ y=b(1-xi^2/(a^2+b^2)) $

Since we have shown $z = e^(i theta_z)$ to be a point on the complex unit circle, we can parameterize $z$ from $zeta = f(z) = z + 1/z$ such that

$ z(t)=z_0 +R e^(i t) $

where $t=theta$, $0<=t<=2 pi$.