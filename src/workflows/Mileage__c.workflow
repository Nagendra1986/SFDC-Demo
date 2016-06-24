<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Sends_an_email_when_mileage_exceeds_100_miles</fullName>
        <description>Sends an email when mileage exceeds 100 miles.</description>
        <protected>false</protected>
        <recipients>
            <recipient>smith.bob1@wipro.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Mileage_Tracker_Email_Templates/Large_Mileage_Notification</template>
    </alerts>
    <rules>
        <fullName>Large Mileage Rule</fullName>
        <actions>
            <name>Sends_an_email_when_mileage_exceeds_100_miles</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Mileage__c.Miles__c</field>
            <operation>greaterThan</operation>
            <value>100</value>
        </criteriaItems>
        <description>To send a notification if miles are greater than 100.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
