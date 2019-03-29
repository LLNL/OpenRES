within OpenRES.Electrical.Generations;

model GenG
  extends OpenRES.Electrical.Essentials.pfComponent;
  parameter Real vf0 = 2.622215878949932 "Initial field voltage";
  parameter Real vref0 = 1.221943942023239 "Reference voltage AVR";
  OpenRES.Electrical.Machines.PSAT.Order6 Order6(D = 0, M = 10, P_0 = P_0, Q_0 = Q_0, Sn = 1500, T1d0 = 8, T1q0 = 0.8, V_0 = V_0, V_b = V_b, Vn = 400, angle_0 = angle_0, fn = 60, ra = 0.001, x1d = 0.302, x1q = 0.5, xd = 1.9, xq = 1.7) annotation(
    Placement(transformation(extent = {{-17, -17}, {17, 17}}, rotation = 0, origin = {55, 1})));
  OpenRES.Interfaces.PwPin pwPin annotation(
    Placement(transformation(extent = {{102, -8}, {122, 12}}), iconTransformation(extent = {{102, -8}, {122, 12}})));
equation
  connect(Order6.vf0, Order6.vf) annotation(
    Line(points = {{42, 20}, {32, 20}, {32, 10}, {34, 10}}, color = {0, 0, 127}));
  connect(Order6.p, pwPin) annotation(
    Line(points = {{72, 1}, {103.85, 1}, {103.85, 2}, {112, 2}}, color = {0, 0, 255}));
  connect(Order6.pm0, Order6.pm) annotation(
    Line(points = {{41.4, -17.7}, {41.4, -26}, {18, -26}, {18, -7.5}, {34.6, -7.5}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-92, 78}, {100, -74}}, lineColor = {28, 108, 200}), Line(points = {{-20, 26}, {6, -6}, {24, 20}}, color = {28, 108, 200}), Line(points = {{-36, 2}, {-20, 26}}, color = {28, 108, 200}), Text(extent = {{-26, -22}, {12, -54}}, lineColor = {28, 108, 200}, textString = "Gen2 6")}),
    Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSAT Manual 2.1.8</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>13/07/2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;OpenRES: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;OpenRES&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The OpenRES is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The OpenRES is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the OpenRES. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end GenG;
