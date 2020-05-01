{{#is_alert}}
${process_name} process not running on {{host.name_tag}} {{host.ip}}
Login to the machine and check if process is up
Restart process if not running e.g.
<pre><code>systemctl restart ${process_name}</code></pre> 
${recipient}
{{/is_alert}}

{{#is_recovery}}
${process_name} process recovered on {{host.name_tag}} {{host.ip}} 
${recipient}
{{/is_recovery}}
