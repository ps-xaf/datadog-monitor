{{#is_alert}}
${custom_name} breached a threshold on {{host.name_tag}} {{host.ip}}
Login to the machine and check if process is up
Restart process if not running e.g.
<pre><code>systemctl restart ${custom_name}</code></pre> 
${recipient}
{{/is_alert}}

{{#is_recovery}}
${custom_name} process recovered on {{host.name_tag}} {{host.ip}} 
${recipient}
{{/is_recovery}}
