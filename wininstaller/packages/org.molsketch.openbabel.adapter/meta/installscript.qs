 
function Component() {}

Component.prototype.createOperations = function()
{
    component.createOperations();

    if (installer.value("os") === "win") {
        component.addOperation("GlobalConfig",
                               "SourceForge",
                               "Molsketch",
                               "obabel-iface-path",
                               installer.value("TargetDir" + "\\obabeliface.dll"));
    }
}
