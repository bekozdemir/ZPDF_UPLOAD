@EndUserText.label: 'Invoice header projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI.headerInfo: {
    typeName: 'Invoice',
    typeNamePlural: 'Invoicesxxxx',
    title: {value: 'Invoice'},
    description: {value: 'Comments'}    
}
define root view entity ZBO_DD_P_INV_HEAD as projection on zbo_DD_INV_HEAD {
    @UI.facet: [{
        id: 'Invoice',
        purpose: #STANDARD,
        label: 'Invoice Data',
        type: #IDENTIFICATION_REFERENCE,
        position: 10 
        }, {
        
        id:'Upload',
        label: 'Upload your attachment',
        position: 20,
        purpose: #STANDARD,
        type: #LINEITEM_REFERENCE,
        targetElement: '_Attachments'}]
        
     @UI: {
        selectionField: [{position: 10 }],
        lineItem: [{position: 10 }],
        identification: [{ position: 10 }]
        }
     key Invoice,
     @UI: {
        selectionField: [{position: 20 }],
        lineItem: [{position: 20 }],
        identification: [{ position: 20 }]
        }
     Comments,
      @UI: {
        selectionField: [{position: 20 }],
        lineItem: [{position: 30 }],
        identification: [{ position: 30 }]
        }
     VendorId,
     @UI: {
        lineItem: [{position: 40 }],
        identification: [{ position: 40 }]
        }
     CustomerName,
     @UI: {
        lineItem: [{position: 50 }],
        identification: [{ position: 50 }]
        }
     LocalCreatedBy,
     @UI: {
        lineItem: [{position: 60 }],
        identification: [{ position: 60 }]
        }
   
     LocalLastChangedBy,
     LocalLastChangedAt,
     LastChangedAt,
     /* Associations */
     _Attachments: redirected to composition child ZBO_DD_P_INV_ATTACH,
     _Customer
}
