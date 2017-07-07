<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>ActionEmail</fullName>
        <description>承認依頼メール送信</description>
        <protected>false</protected>
        <recipients>
            <recipient>dev_kadachi@salesforce.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>DEMO/JobOfferApproval</template>
    </alerts>
    <fieldUpdates>
        <fullName>ApprovalStatusUppdate</fullName>
        <field>ApprovalStatus__c</field>
        <literalValue>未承認</literalValue>
        <name>承認ステータス更新</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
</Workflow>
