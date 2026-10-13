#import "../template.typ": *
#counter(page).update(1)
#set page(numbering: "1", number-align: top+right, margin: 2.5cm)

The ILCA 7 has a single mainsail @WorldILCA. Its horizontal cross-section can be represented by a curved foil, while the daggerboard acts as a foil in water. My aim is to derive the sectional lift coefficient of an idealized sail as a function of angle of attack using the Joukowski transformation and potential-flow theory. I will begin with the geometry of a circle, transform it into an airfoil, then use the transformed flow to calculate pressure and lift. This will allow me to investigate why changing the sail angle changes its predicted lift.

The apparent wind is the air velocity relative to the moving boat. If $bold(U)_T$ is the true air velocity and $bold(V)_B$ is the boat velocity in the same reference frame, then $bold(U)_A=bold(U)_T-bold(V)_B$. I will use $U_infinity=|bold(U)_A|$ for the undisturbed apparent-wind speed at the height of the section. The chord is the straight line joining its leading and trailing edges, and camber describes the curvature of the mean line between its two surfaces. Angle of attack, $alpha$, is the signed angle between the chord and the incoming flow direction, with the sign convention fixed below. Lift is the force perpendicular to this flow, so lift on a sail need not act upward.

For this exploration, I will treat the sail section as fixed and impermeable. The air will be modelled as a continuum with constant density, $rho$, in steady two-dimensional flow. I will neglect viscosity in the outer flow and assume that this flow is irrotational and remains attached to the section. These assumptions allow a tractable mathematical model. They exclude the sail's deformation, variation with height, and separated flow. I have no measured coordinates of an ILCA sail section in this exploration, so the profile used later will be an illustrative cambered section, with explicitly chosen dimensions.

The quantity I want to determine is

$ C_l=L'/(frac(1,2)rho U_infinity^2 c), $ <cl-definition>

where $L'$ is lift per unit span, in $"N m"^(-1)$, and $c$ is chord length. The denominator has the same units as $L'$, making $C_l$ dimensionless. This is a definition of the sectional coefficient; calculating its value still requires a model for the force. Gerhardt, Flay and Richards use this definition in their equation (3.40), with $2b$ denoting the chord, and extend their derivation to the mainsail @GERHARDT2011Unsteady. I use a lower-case $l$ to distinguish this sectional coefficient from a coefficient based on the area and total force of an entire sail.

To begin constructing the section, let $z=x+i y$, where $x,y in RR$ and $i^2=-1$. Its modulus is $|z|=sqrt(x^2+y^2)$ and its conjugate is $overline(z)=x-i y$. For $z!=0$, write $z=r(cos theta+i sin theta)$, where $r=|z|$. The angle $theta$ must be selected in the correct quadrant. In particular, $arctan(y/x)$ alone does not give the argument in every quadrant. Arguments that differ by $2pi$ describe the same direction.

Complex multiplication will be useful because it combines a change in length with a change in angle. For two nonzero numbers $z_1=r_1 (cos theta_1+i sin theta_1)$ and $z_2=r_2 (cos theta_2+i sin theta_2)$, the angle-addition identities give

$ z_1 z_2=r_1 r_2[cos(theta_1+theta_2)+i sin(theta_1+theta_2)]. $ <multiplication>

Therefore $|z_1 z_2|=|z_1||z_2|$, while their arguments add modulo $2pi$. This also gives $|z^n|=|z|^n$ for nonnegative integers: the result holds for $n=0$, and multiplying the result for $n=k$ by $|z|$ proves it for $n=k+1$. When $z!=0$, the identity $|1/z|=1/(|z|)$ extends the result to negative integers. The condition $z!=0$ is needed whenever a negative power occurs.

I will use the exponential form of a complex number to parameterize the circle. The power-series definition of the exponential extends to complex inputs. @Campuzano2019Complex For real $t$, separating its even and odd powers gives

$ e^(i t)=sum_(n=0)^infinity (i t)^n/(n!)
  =sum_(m=0)^infinity ((-1)^m t^(2m))/((2m)!)
  +i sum_(m=0)^infinity ((-1)^m t^(2m+1))/((2m+1)!). $ <euler-series>

These are the Maclaurin series for cosine and sine. The exponential series is absolutely convergent, so this separation is valid. It follows that

$ e^(i t)=cos t+i sin t, quad |e^(i t)|=sqrt(cos^2 t+sin^2 t)=1. $ <euler>

Thus $e^(i t)$ traces the unit circle as $t$ runs from $0$ to $2pi$. Multiplication by a positive radius $R$ and translation by a centre $z_0=h+i k$ give

$ z(t)=z_0+R e^(i t)=(h+R cos t)+i(k+R sin t), quad 0<=t<=2pi. $ <circle>

I will call this the $z$-plane and use $zeta=xi+i eta$ for the mapped plane. This keeps the original circle in the familiar Roman-letter coordinates before introducing the transformed coordinates.

To understand how a complex function changes this geometry, consider its derivative. The definition is

$ f'(z_*)=lim_(Delta z->0)(f(z_*+Delta z)-f(z_*))/(Delta z). $ <derivative>

Although this has the same form as a real derivative, the limit must be independent of the direction in which $Delta z$ approaches zero. A function is analytic on an open region if it is complex differentiable throughout that region. An open region contains a sufficiently small neighbourhood around each of its points. @Campuzano2019Complex

For a sufficiently small displacement, @derivative gives $Delta zeta approx f'(z_*)Delta z$. If $f'(z_*)=s e^(i omega)$ with $s>0$, @multiplication shows that the displacement is locally scaled by $s$ and rotated by $omega$. Every direction at the same point undergoes the same rotation. Consequently, the angles between intersecting smooth curves are preserved. A map with this property is conformal. The requirement $f'(z_*)!=0$ matters because a zero derivative removes this local rotation-and-scaling description. @Campuzano2019Complex

The transformation I will use is

$ zeta=f(z)=z+a^2/z, quad a>0, quad z!=0. $ <joukowski>

Here $a$ is a length scale, and $x,y$ remain the coordinates of the original complex number. The factor $a^2$ ensures that both terms in the transformation have units of length. Rationalizing its denominator gives

$ zeta=x+i y+(a^2(x-i y))/(x^2+y^2), quad
  xi=x(1+a^2/(x^2+y^2)), quad
  eta=y(1-a^2/(x^2+y^2)). $ <mapped-coordinates>

This is the Joukowski transformation, which maps suitable circles into airfoil profiles. @Campuzano2019Complex In particular, for a circle centred at the origin with radius $a$, substituting $z=a e^(i t)$ gives $zeta=a(e^(i t)+e^(-i t))=2a cos t$. The image is the line segment from $-2a$ to $2a$. This explains why simply transforming the unit circle produces a flat plate. A curved section requires a displaced circle.

The derivative and second derivative are

$ f'(z)=1-a^2/z^2, quad f''(z)=2a^2/z^3. $ <map-derivatives>

The derivative vanishes at $z=plus.minus a$. For the airfoil family considered here, I choose $h<0$ and

$ R=|a-z_0|=sqrt((a-h)^2+k^2). $ <circle-radius>

The circle then passes through $z=a$, which maps to $zeta=2a$. It also contains $z=-a$, since $R^2-|-a-z_0|^2=-4a h>0$, and contains $z=0$, since $R^2-|z_0|^2=a^2-2a h>0$. Thus the singularity at zero and the other critical point are inside the obstacle, outside the modelled fluid. For this family the exterior maps one-to-one onto the exterior of the airfoil. @Campuzano2019Complex The critical point on the boundary produces the sharp trailing edge. In fact,

$ f(z)-2a=(z-a)^2/z, $ <cusp>

so near $z=a$, the leading change in the image is proportional to $(z-a)^2$. This is why the smooth circle can map to a boundary with a cusp. The mapping is conformal in the exterior fluid region, with special care needed at the trailing edge itself.

For a numerical example, I choose $h/a=-0.05$ and $k/a=0.10$. These are modelling choices, not measurements of the ILCA 7. The negative horizontal offset gives the profile a rounded nose and a small finite thickness. The vertical offset gives it camber. Finite thickness is useful here because the limiting zero-thickness profile can have a singular leading-edge velocity. I will express all geometric lengths in units of $a$ for the calculations.

//#image("../Resources/joukowski_section.svg", width: 100%)

Figure 1: The generating circle (blue), mapped section (red) and chord (dashed grey). The two curves belong to separate complex planes and are overlaid for comparison. The curves are calculated from @circle and @mapped-coordinates.

The coordinates in @mapped-coordinates are also directly plottable in Desmos. Setting $x(t)=h+R cos t$ and $y(t)=k+R sin t$ gives the original curve $(x(t),y(t))$ and the transformed curve $(xi(t),eta(t))$. Both need the parameter interval $0<=t<=2pi$. Varying the parameter maps every point on the circumference and traces the complete profile.

The chord of the displaced profile needs to be calculated from its actual geometry. For this rounded-nose family, I identify the leading edge $zeta_L$ as the point farthest from the trailing edge $zeta_T=2a$. Writing $g(t)=f(z(t))$, I find this point by maximizing $H(t)=|g(t)-2a|^2$. Its stationary points satisfy

$ H'(t)=2 op("Re")[overline(g(t)-2a) g'(t)]=0, quad
g'(t)=f'(z(t))i R e^(i t). $ <nose-condition>

The maximum near $t=pi$ gives the nose; the zero-distance minimum is the trailing edge. Defining $c=|zeta_T-zeta_L|$ and $delta=arg(zeta_T-zeta_L)$ then fixes the chord length and its angle relative to the $xi$-axis. Numerically solving @nose-condition gives

$ R/a approx 1.054751, quad zeta_L/a approx -2.009174+0.001759i, \
c/a approx 4.009174, quad delta approx -0.000438784. $ <geometry-values>

Here and throughout the derivation, angles are in radians unless a degree symbol is shown. The chord tilt is only about $-0.02514 degree$, but retaining it avoids silently treating the coordinate axis as the chord. I define $chi$ as the direction of the free-stream velocity relative to the positive $xi$-axis and choose the signed angle of attack so that

$ alpha=chi-delta, quad chi=alpha+delta. $ <incidence>

Now that the geometry is defined, I need a flow which passes around it. I will first construct this flow around the circle, where the boundary condition is simple. In the circle plane, let $u_z$ and $v_z$ be the horizontal and vertical fluid velocities. Irrotational flow admits a velocity potential $phi$ locally, so $u_z=partial phi/partial x$ and $v_z=partial phi/partial y$. Incompressibility requires $partial u_z/partial x+partial v_z/partial y=0$. Combining these statements gives

$ (partial^2 phi)/(partial x^2)+(partial^2 phi)/(partial y^2)=0. $ <laplace>

This is Laplace's equation. Its linearity means that suitable potential-flow solutions can be added. A stream function $psi$ is defined by $u_z=partial psi/partial y$ and $v_z=-partial psi/partial x$. Along a streamline, $d psi=-v_z d x+u_z d y=0$. A boundary on which $psi$ is constant therefore has no flow through it.

The velocity potential and stream function can be combined into a complex potential, $W(z)=phi(x,y)+i psi(x,y)$. Their derivative relationships are the Cauchy-Riemann equations, making $W$ locally analytic. Consequently,

$ W'(z)=phi_x+i psi_x=u_z-i v_z. $ <complex-velocity>

This result explains why a complex derivative can encode a velocity field. Its real part gives the horizontal velocity and the negative of its imaginary part gives the vertical velocity. The imaginary unit is a way of representing two real components; it does not make the velocity imaginary. The use of complex potentials for this flow is developed in Olver's discussion of fluid motion @Olver2024Complex.

Let $w=z-z_0$, so the circle boundary is $|w|=R$. Uniform flow at angle $chi$ has potential $U_infinity e^(-i chi)w$. Adding a doublet with coefficient $A$ gives $W_0=U_infinity e^(-i chi)w+A/w$. On $w=R e^(i theta)$, choosing $A=U_infinity R^2 e^(i chi)$ makes these terms complex conjugates, so their sum is real. Therefore $psi=0$ on the circle. This constructs the no-penetration condition directly:

$ W_0 (z)=U_infinity (e^(-i chi)w+(R^2 e^(i chi))/w). $ <circle-potential>

Far from the circle, the derivative of the doublet term tends to zero, leaving the required uniform flow. The doublet's singularity is at the circle centre, inside the excluded solid region. This is the uniform-flow case of the circle theorem. @Campuzano2019Complex

However, @circle-potential is not the only flow satisfying these conditions. A vortex term can be added while keeping the circle a streamline. I define $Gamma$ as positive for clockwise circulation, so that on a counterclockwise path $C$ enclosing the body,

$ Gamma=-integral.cont_C (u_z d x+v_z d y). $ <circulation>

The full potential is

$ W(z)=U_infinity (e^(-i chi)w+(R^2 e^(i chi))/w)
  +(i Gamma)/(2pi) op("Log")(w/R). $ <full-potential>

Writing $w=r e^(i theta)$, a local logarithm is $op("Log")(w/R)=ln(r/R)+i theta$. The vortex part therefore adds tangential velocity $-Gamma/(2pi r)$, which is clockwise for positive $Gamma$. The corresponding stream function is

$ psi(r,theta)=U_infinity (r-R^2/r)sin(theta-chi)
  +Gamma/(2pi)ln(r/R). $ <stream-function>

Both terms vanish at $r=R$, for every value of $Gamma$. Thus the boundary condition and the far-field velocity alone do not select a unique circulation. The vortex contribution does not imply that the sail rotates. It represents an asymmetry in the overall flow. Also, although the logarithm changes branch after a complete circuit, its derivative $1/w$ is single-valued. The potential may be multivalued around the obstacle while the physical velocity is well defined and locally irrotational. @Campuzano2019Complex

The next step is to carry this flow into the airfoil plane. Define $tilde(W)(zeta)=W(f^(-1)(zeta))$ on the exterior branch of the inverse. The chain rule gives the mapped complex velocity

$ q(zeta)=u-i v=(d tilde(W))/(d zeta)
  =(W'(z))/(f'(z))
  =(U_infinity (e^(-i chi)-(R^2 e^(i chi))/w^2)+(i Gamma)/(2pi w))/(1-a^2/z^2). $ <mapped-velocity>

The local analytic inverse ensures that the transformed potential still satisfies the ideal-flow equations. The boundary remains a streamline because its value of $psi$ is unchanged. Its velocity is changed by the factor $1/f'(z)$, so simply moving the circle's velocity arrows to the new boundary would give the wrong speeds. Since $f'(z)->1$ at infinity, the free-stream speed and direction remain $U_infinity$ and $chi$ @NASAConformal.

At the trailing-edge preimage $z=a$, the denominator of @mapped-velocity vanishes. For a generic circulation, the numerator does not, and the model would predict unbounded speed at the trailing edge. The Kutta condition selects a flow leaving the sharp trailing edge smoothly with finite velocity. It is an additional physical condition used with the inviscid model; it is not a consequence of incompressibility alone. MIT's notes distinguish a cusped trailing edge, where the surface velocities meet with a common finite value, from a finite-angle edge @Darmofal2005Kutta.

To apply this condition, write

$ a-z_0=R e^(-i beta), quad beta=arctan(k/(a-h)). $ <beta>

Here $a-h>0$, so this inverse tangent has the correct quadrant. At $z=a$, the numerator of @mapped-velocity becomes

$ W'(a)=U_infinity (e^(-i chi)-e^(i chi+2i beta))
  +(i Gamma e^(i beta))/(2pi R)
  =i e^(i beta)[-2U_infinity sin(chi+beta)+Gamma/(2pi R)]. $ <kutta-numerator>

Setting this equal to zero yields

$ Gamma=4pi R U_infinity sin(chi+beta)
  =4pi R U_infinity sin(alpha+delta+beta). $ <selected-circulation>

This is the point at which the geometry and angle of attack select a specific circulation. I must also check that the cancellation gives a finite limiting velocity. Since $f''(a)=2/a!=0$, Taylor expansion of the numerator and denominator gives

$ q_T=lim_(z->a)(W'(z))/(f'(z))=(W''(a))/(f''(a)), quad
W''(z)=(2U_infinity R^2 e^(i chi))/w^3-(i Gamma)/(2pi w^2). $ <trailing-limit>

Both derivatives on the right are finite because $a-z_0!=0$. Thus the selected circulation removes the divergent speed. Zero velocity at the relevant point in the circle plane does not imply zero velocity at the airfoil's trailing edge; both the numerator and the mapping derivative vanish there.

To calculate the force, I must relate this velocity field to pressure. Along a horizontal streamline, Newton's second law for a steady inviscid fluid gives $rho V d V=-d p$. Integrating, and using the undisturbed conditions to determine the constant, produces Bernoulli's equation,

$ p+frac(1,2)rho V^2=p_infinity+frac(1,2)rho U_infinity^2,
quad C_p=(p-p_infinity)/(frac(1,2)rho U_infinity^2)=1-frac(abs(q)^2,U_infinity^2). $ <pressure>

The same Bernoulli constant applies throughout this connected irrotational flow @Yue2005Marine @pressure. allows me to calculate the pressure on both surfaces from @mapped-velocity. There is no assumption that particles taking different routes around the section have to meet again at the trailing edge.

//#image("../Resources/pressure_coefficients.svg", width: 100%)

Figure 2: Calculated surface pressure coefficients for the illustrative section at $alpha=5 degree$. Negative pressure coefficients are plotted upward. These curves use @mapped-velocity and @pressure; they are predictions of the model.

The lower pressure over much of the upper surface in Figure 2 suggests a resultant force toward that side. To establish its magnitude and direction, I need to integrate the pressure around the full section. Let $C$ follow the airfoil boundary counterclockwise. For a small boundary element, the outward normal multiplied by arc length is $(d eta,-d xi)$. Since pressure pushes inward, the force per unit span satisfies

$ F_xi=-integral.cont_C p d eta, quad F_eta=integral.cont_C p d xi,
quad F_xi-i F_eta=-i integral.cont_C p d overline(zeta). $ <pressure-force>

Constant pressure contributes no resultant around a closed contour. Substituting @pressure therefore leaves

$ F_xi-i F_eta=(i rho)/2 integral.cont_C |q|^2 d overline(zeta). $ <force-step>

Along the boundary, $d psi=0$, so $d tilde(W)=q d zeta$ is real. It equals its complex conjugate: $q d zeta=overline(q)d overline(zeta)$. Multiplying by $q$ gives $q^2 d zeta=|q|^2 d overline(zeta)$. Consequently,

$ F_xi-i F_eta=(i rho)/2 integral.cont_C q(zeta)^2 d zeta. $ <blasius>

This is Blasius' force formula, also stated in Olver's Theorem 7.13 @Olver2024Complex. The derivation shows how it follows from the pressure integral and the streamline boundary condition.

The remaining integral looks difficult on the airfoil, but far from it the velocity is much simpler. Because $q^2$ is analytic in the exterior fluid, Cauchy's contour-deformation theorem allows the boundary contour to be moved outward to a large circle without changing the integral. The theorem applies to the region between the contours; no analyticity inside the solid is assumed. @Campuzano2019Complex The finite trailing-edge limit allows the original integral to be interpreted by approaching the boundary from the exterior.

As $|zeta|$ becomes large, @joukowski gives $z=zeta+O(1/zeta)$, and @mapped-velocity gives

$ q(zeta)=U_infinity e^(-i chi)+(i Gamma)/(2pi zeta)+O(1/zeta^2),
quad q(zeta)^2=U_infinity^2 e^(-2i chi)
  +(i U_infinity Gamma e^(-i chi))/(pi zeta)+O(1/zeta^2). $ <far-field>

The notation $O(1/zeta^2)$ means that the magnitude of the omitted remainder is bounded by a constant times $1/|zeta|^2$ at large distances. On a circle of radius $s$, its integral is therefore bounded by a constant times $2pi s/s^2$, which tends to zero. The constant term integrates to zero. Parameterizing the large circle by $zeta=s e^(i t)$ gives

$ integral.cont (d zeta)/zeta=integral_0^(2pi)(i s e^(i t))/(s e^(i t)) d t=2pi i. $ <circle-integral>

Only the reciprocal term in @far-field contributes. Substitution into @blasius gives

$ F_xi-i F_eta=(i rho)/2 ((i U_infinity Gamma e^(-i chi))/pi)(2pi i)
  =-i rho U_infinity Gamma e^(-i chi). $ <complex-force>

Expanding this expression gives the vector

$ (F_xi,F_eta)=rho U_infinity Gamma(-sin chi,cos chi). $ <force-vector>

The free-stream direction is $(cos chi,sin chi)$. Its dot product with @force-vector is zero, showing that this ideal model predicts no drag. The perpendicular unit vector $(-sin chi,cos chi)$ defines positive lift. Taking the dot product in that direction yields the Kutta-Joukowski result

$ L'=rho U_infinity Gamma. $ <kutta-joukowski>

This connects the circulation selected at the trailing edge to the net pressure force. Combining @selected-circulation, @kutta-joukowski and @cl-definition gives the result I set out to obtain:

$ L'=4pi rho R U_infinity^2 sin(alpha+delta+beta), quad
  C_l (alpha)=(8pi R)/c sin(alpha+delta+beta). $ <final-coefficient>

Here $R$, $beta$, $delta$ and $c$ are determined by the selected circle and its mapped section. The dependence on $rho$ and $U_infinity$ cancels in $C_l$. This is consistent with the definition: doubling $U_infinity$ multiplies the predicted dimensional lift by four, while the coefficient is unchanged at fixed geometry and incidence. Scaling every geometric length by the same positive factor also leaves $R/c$, $beta$ and $delta$ unchanged, so the ideal sectional coefficient is independent of absolute size.

For the chosen section, @geometry-values and @beta give $beta approx 0.094951706$ and $beta+delta approx 0.094512922$. The numerical coefficient is therefore

$ C_l (alpha) approx 6.612032 sin(alpha+0.094512922). $ <numerical-coefficient>

At $alpha=5 degree=5pi/180$, this predicts $C_l approx 1.195323$. This number describes the illustrative profile under the stated conditions. It does not establish the lift coefficient of a particular trimmed ILCA sail.

To check the calculation, I also evaluate @pressure-force numerically without using @kutta-joukowski. At midpoint values $t_j=2pi(j+1/2)/N$, for $j=0,dots,N-1$, define $p_j^*=p(t_j)-p_infinity$ from @pressure. The midpoint sums are

$ F_xi approx -(2pi)/N sum_(j=0)^(N-1)p_j^* eta'(t_j), quad
  F_eta approx (2pi)/N sum_(j=0)^(N-1)p_j^* xi'(t_j). $ <numerical-force>

The primes on $xi$ and $eta$ here mean derivatives with respect to $t$, whereas the prime on $L'$ means per unit span. Resolving these force sums perpendicular and parallel to the free stream gives the numerical $C_l$ and $C_d$. Setting $a=U_infinity=rho=1$ merely chooses units for this dimensionless check. The following values were computed from the full mapped boundary; the calculation is reproduced in the accompanying Python file.

#align(center,
  table(
    align: center,
    columns: 3,
    [*$N$*], [*Numerical $C_l$*], [*Numerical $C_d$*],
    [32], [1.190231642], [$-3.3063 times 10^(-3)$],
    [64], [1.195496079], [$1.7163 times 10^(-4)$],
    [128], [1.195322877], [$4.0266 times 10^(-7)$],
    [256], [1.195322725], [$1.1736 times 10^(-12)$],
  )
)

Table 1: Convergence of direct surface-pressure integration at $alpha=5 degree$. The analytical predictions are $C_l=1.195322725 dots$ and $C_d=0$.

The agreement in Table 1 checks the transformation, force signs and normalization using a second calculation. It also shows how insufficient resolution can produce a small artificial drag. This is a check of the mathematics and numerical implementation; agreement between two calculations of the same ideal model does not validate its assumptions against real sailing conditions.

To investigate the dependence on angle, I keep $h/a=-0.05$ fixed and compare $k/a=0$, $0.05$ and $0.10$. Each circle's radius is recalculated using @circle-radius, and its chord and chord angle are recalculated using @nose-condition. Thus this comparison changes the profile geometry consistently. It does not hold thickness exactly constant while changing camber.

//#image("../Resources/lift_coefficients.svg", width: 100%)

Figure 3: Predicted sectional lift coefficients for three generating-circle offsets. These curves compare ideal-flow solutions, not measured performance or a verified attached-flow operating range.

In Figure 3 the symmetric section, $k=0$, produces zero lift at zero incidence. Increasing the positive vertical offset moves the zero-lift crossing to a negative angle. From @final-coefficient, the zero nearest $alpha=0$ is

$ alpha_0=-(delta+beta). $ <zero-lift>

For the three profiles, the predicted zero-lift angles are $0 degree$, $-2.71391 degree$ and $-5.41519 degree$, respectively. The cambered example therefore has positive lift even when its chord is aligned with the flow. At the special incidence $alpha_0$, however, it has zero net lift despite its curved shape. This makes clear that camber alone does not guarantee lift at every angle; the circulation selected by the geometry and incidence is what enters @kutta-joukowski.

Differentiating @final-coefficient with respect to angle in radians gives

$ (d C_l)/(d alpha)=(8pi R)/c cos(alpha+delta+beta). $ <lift-slope>

For the chosen profile at $alpha=0$, this is about $6.58252$ per radian, or $0.114887$ per degree. A one-degree increase near this point therefore increases the model coefficient by approximately $0.115$. Close to the zero-lift angle, $sin(alpha-alpha_0) approx alpha-alpha_0$, giving the local linear approximation $C_l approx (8pi R/c)(alpha-alpha_0)$. This explains the nearly straight curves over the plotted interval.

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
