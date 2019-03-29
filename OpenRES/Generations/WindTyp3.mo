within OpenRES.Electrical.Generations;

model WindTyp3
  extends Modelica.Icons.SensorsPackage;
  OpenRES.Electrical.Wind.PSSE.WT3G.WT3G1 wt3g11(K_ipll = 1, K_pll = 1, P_0 = 3, P_llmax = 1, P_rated = 1, Q_0 = 0.3, X_eq = 0.002)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.PwPin pwPin1 annotation(
    Placement(visible = true, transformation(origin = {98, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(wt3g11.p, pwPin1) annotation(
    Line(points = {{12, 0}, {94, 0}, {94, 2}, {98, 2}}, color = {0, 0, 255}));
  connect(wt3g11.Ipcmd, wt3g11.ipcmd0);
  connect(wt3g11.Eqcmd, wt3g11.eqcmd0);
end WindTyp3;
