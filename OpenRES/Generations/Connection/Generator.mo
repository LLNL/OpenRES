within OpenRES.Interfaces;
partial model Generator "Interface for a generator which provides the PwPin"
  extends OpenRES.Electrical.Essentials.pfComponent;
  parameter Boolean displayPF=false "Display power flow results:" annotation (
      Dialog(
      group="Visualisation",
      __Dymola_compact=true,
      __Dymola_descriptionLabel=true), choices(checkBox=true));
  OpenRES.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={
            {100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  OpenRES.Types.ActivePowerMega P "Active power";
  OpenRES.Types.ReactivePowerMega Q "Reactive power";
equation
  -P = (pwPin.vr*pwPin.ir + pwPin.vi*pwPin.ii)*S_b "Active power";
  -Q = (pwPin.vi*pwPin.ir - pwPin.vr*pwPin.ii)*S_b "Reactive power";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),Line(
          points={{20,-20},{50,-40},{80,0}},
          color={0,0,0},
          thickness=0.5),Text(
          extent={{-40,20},{40,-20}},
          lineColor={0,0,0},
          textString="%name"),Text(
          visible=displayPF,
          extent={{-80,160},{80,80}},
          lineColor={255,0,0},
          textString=DynamicSelect("0.0 MW",
            OpenRES.NonElectrical.Functions.displayPower(P, " MW"))),Polygon(
          visible=displayPF,
          points=DynamicSelect({{-20,80},{-20,60},{20,70},{-20,80}}, if P >= 0
             then {{-20,80},{-20,60},{20,70},{-20,80}} else {{20,80},{20,60},{-20,
            70},{20,80}}),
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{-80,-80},{80,-160}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0 Mvar",
            OpenRES.NonElectrical.Functions.displayPower(Q, " Mvar"))),Polygon(
          visible=displayPF,
          points=DynamicSelect({{-20,-80},{-20,-60},{20,-70},{-20,-80}}, if Q
             >= 0 then {{-20,-80},{-20,-60},{20,-70},{-20,-80}} else {{20,-80},
            {20,-60},{-20,-70},{20,-80}}),
          lineColor={0,255,0},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid),Line(
          points={{-20,20},{-50,40},{-80,0}},
          color={0,0,0},
          thickness=0.5)}), Documentation);
end Generator;
