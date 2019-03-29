within OpenRES.Electrical.Machines.PSAT;
model Order2 "Second Order Synchronous Machine with Inputs and Outputs"
  extends BaseClasses.baseMachine(vf(start=vf00), xq0=x1d);
protected
  parameter Real K=1/(ra^2 + x1d^2) "a constant for scaling";
  parameter Real c1=ra*K "scaled ra";
  parameter Real c2=x1d*K "scaled x'd";
  parameter Real c3=x1d*K "scaled x'd";
  parameter Real vf00=V_MBtoSB*(vq0 + ra*iq0 + x1d*id0) "Init. val. (pu, SB)";
equation
  id = -c1*vd - c3*vq + vf_MB*c3;
  iq = c2*vd - c1*vq + vf_MB*c1;
  vf0 = vf00;
  annotation (Documentation(info="<html> 
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"> 
<tr> 
<td><p>Reference</p></td> 
<td><p>Order II Synchonous Machine, PSAT Manual 2.1.8</p></td> 
</tr> 
<tr> 
<td><p>Last update</p></td> 
<td>September 2015</td> 
</tr> 
<tr> 
<td><p>Author</p></td> 
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td> 
</tr> 
<tr> 
<td><p>Contact</p></td> 
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td> 
</tr> 
</table> 
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}, initialScale=
            0.1), graphics={Text(
          origin={0,60},
          extent={{-60,-20},{60,20}},
          lineColor={28,108,200},
          textString="Order II")}));
end Order2;
