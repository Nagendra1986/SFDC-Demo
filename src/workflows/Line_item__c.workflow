<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Insert_Merchandise_Price</fullName>
        <field>Unit_Price__c</field>
        <formula>merchandise__r.Price__c</formula>
        <name>Insert Merchandise Price</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Stock_Inventory</fullName>
        <field>Total_Inventory__c</field>
        <formula>IF (
ISNEW(),
merchandise__r.Total_Inventory__c - Units_sold__c ,
merchandise__r.Total_Inventory__c - (Units_sold__c - PRIORVALUE(Units_sold__c))
)</formula>
        <name>Update Stock Inventory</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>merchandise__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Line Item Created</fullName>
        <actions>
            <name>Insert_Merchandise_Price</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Line Item Updated</fullName>
        <actions>
            <name>Update_Stock_Inventory</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Invoice_statement__c.Status__c</field>
            <operation>equals</operation>
            <value>open</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
