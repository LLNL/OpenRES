within OpenRES.Electrical.Buses;
model InternalBus "Bus for change base"
  outer OpenRES.Electrical.SystemBase SysData;
  constant Real pi=Modelica.Constants.pi;
  parameter Real M_b=120 "Machine base power rating (MVA)"
    annotation (Dialog(group="Power flow data"));
  parameter Real S_b=SysData.S_b "System base power rating (MVA)"
    annotation (Dialog(group="Power flow data"));
  OpenRES.Interfaces.PwPin p "Machine base" annotation (Placement(
        transformation(extent={{-32,-4},{-12,16}}), iconTransformation(extent={
            {-32,-4},{-12,16}})));
  OpenRES.Interfaces.PwPin n "System base" annotation (Placement(
        transformation(extent={{8,-4},{28,16}}), iconTransformation(extent={{8,
            -4},{28,16}})));
protected
  parameter Real CoB=M_b/S_b;
equation
  0 = n.vr - p.vr;
  0 = n.vi - p.vi;
  0 = p.ir*CoB + n.ir;
  0 = p.ii*CoB + n.ii;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{8,96},{-12,-88}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Text(
          extent={{-46,34},{-22,2}},
          lineColor={0,0,255},
          textString="*")}),
    Diagram(graphics),
    Documentation);
end InternalBus;
