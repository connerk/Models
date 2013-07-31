import math

a=1.0
b=2.0
g=6.0
h=5.0

def psiout1(psi):
    ca=math.sin(psi)
    cb=(g/a)+math.cos(psi)
    cc=(g/b)*math.cos(psi) + (a**2-h**2+b**2+g**2)/(2.0*a*b)
    fm=ca-math.sqrt(ca**2+cb**2-cc**2)
    fp=ca+math.sqrt(ca**2+cb**2-cc**2)
    f2=cb+cc
    psiminus=2.0*math.atan2(fm,f2)
    psiplus=2.0*math.atan2(fp,f2)
    return psiplus,psiminus

def run1():
    pi1=math.pi
    print("a=%.2f, b=%.2f, g=%.2f, h=%.2f")%(a,b,g,h)
    print("psi,psi1minus,psi1plus")
    # psi range from +0.5*pi to -0.5*pi
    il=[(0.5-0.1*i) for i in range(11)]
    thlist=[i*pi1 for i in il]
    for t in thlist:
        xa=a*math.cos(t)
        ya=a*math.sin(t)
        pp,pm=psiout1(t)
        xbm=b*math.cos(pm)
        ybm=b*math.sin(pm)
        xbp=b*math.cos(pp)
        ybp=b*math.sin(pp)
        print("%.2f  %.2f, %.2f, a=(%.2f, %.2f), bm=(%.2f, %.2f), bp=(%.2f, %.2f)")%(math.degrees(t),math.degrees(pm),math.degrees(pp),xa,ya,xbm,ybm,xbp,ybp)
