{{#is_alert}}
${metrics} is above ${critical} on {{host.name_tag}} {{host.ip}} 
${recipient}
{{/is_alert}}

{{#is_recovery}}
${metrics} recovered and dropped below ${critical} on {{host.name_tag}} {{host.ip}} 
${recipient}
{{/is_recovery}}
