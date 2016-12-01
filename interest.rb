d = (p + pr - (pr)tax)**t

t_rt(d) = p + pr - pr*tax
t_rt(d) = p(1 + r - r(tax))
t_rt(d)/p = 1 + r - r(tax)
t_rt(d)/p - 1 = r(1 - tax)
t_rt(d)/p = 1 + r(1 - tax)
d/p = (1 + r(1 - tax))**t
log_(1 + r(1 - tax))(d/p) = t

Math::log(desired.to_f / principal, 1 + interest * (1 - tax)).ceil
