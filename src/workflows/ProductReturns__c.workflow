<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>UpdateAssetStaus</fullName>
        <active>false</active>
        <criteriaItems>
            <field>ProductReturns__c.Name</field>
            <operation>equals</operation>
            <value>Asset1</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
