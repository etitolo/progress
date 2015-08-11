[#import '/macros/config.ftl' as config/]

[#-- 
    The Problem: Common config.ftl isn't returning the hashes in the correct order
    while the Brand config.ftl is.

    Rather than adding this hash to all the Brand config.ftl, I stumbled on an
    alternative. The hash below sets up the key name's order in the list. Since
    the local key names are the same as the key names in config.ftl, I'm
    retrieving the values from Brand or Common config.ftl. 
--]

[#assign localSteps = {
    'shipping': '',
    'deliveryoptions': '',
    'billing': '',
    'payment': '',
    'conf': ''
}]

[#assign steps = config.checkoutProgresBarSteps /]

[#macro show currentStepIndex]
    <ol class="checkout-progress-bar">
        [#list localSteps?keys as stepId]
            <li class="checkout-progress-bar-step ${'step-' + stepId} ${(stepId_index == currentStepIndex)?string('current','')} [#if stepId_index lt currentStepIndex]preceder[/#if]">
                [#if stepId_index lt currentStepIndex]
                    <a class="step-label" href="[@wsgc.secureappurl url='/checkout/${stepId}.html'/]">${steps[stepId]}</a>
                [#else]
                    <span class="step-label">${steps[stepId]}</span>
                [/#if]
            </li>
        [/#list]
    </ol>
[/#macro]


