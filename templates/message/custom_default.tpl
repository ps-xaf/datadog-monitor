{{#is_alert}}
${name} breached a critical threshold on {{host.name_tag}} {{host.ip}}
Login to the machine and check if process is up
Restart process if not running e.g.
<pre><code>systemctl restart ${name}</code></pre>
${recipient}
{{/is_alert}}

{{#is_alert_recovery}}
${name} process recovered on {{host.name_tag}} {{host.ip}}
${recipient}
{{/is_alert_recovery}}