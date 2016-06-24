<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>set_Final_Approval_Status</fullName>
        <field>Status__c</field>
        <literalValue>closed</literalValue>
        <name>set Final Approval Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>set_Final_Rejection_Status</fullName>
        <field>Status__c</field>
        <literalValue>open</literalValue>
        <name>set Final Rejection Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>set_Intial_Approval_Status</fullName>
        <field>Status__c</field>
        <literalValue>Pending</literalValue>
        <name>set Intial Approval Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
</Workflow>
