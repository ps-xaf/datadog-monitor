{{#is_alert}}
${metrics}  utilization is above ${critical}% on {{host.name_tag}} {{host.ip}} 
${recipient}
{{/is_alert}}

{{#is_recovery}}
${metrics} recovered and utilization dropped below ${critical}% on {{host.name_tag}} {{host.ip}} 
${recipient}
{{/is_recovery}}
