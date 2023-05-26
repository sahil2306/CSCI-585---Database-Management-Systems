from math import sin,cos,pi

t = 0.00
R = 6.0
r = 1.0
a = 8.0
TT = (34.02060008608866, -118.28546839571496)
with open("spirographic_points.txt", 'w') as f:
    while t < 12*pi:
        x = ((R + r) * cos((r / R) * t) - a * cos((1 + r / R) * t))*0.03
        x+=TT[1]
        y = ((R + r) * sin((r / R) * t) - a * sin((1 + r / R) * t))*0.03
        y+=TT[0]
        x = str(x)
        y = str(y)
        string=""
        string+= "{},{}\n".format(x,y)
        f.write(string)
        t+=0.01