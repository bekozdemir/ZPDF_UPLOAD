@EndUserText.label: 'Attachment projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI.headerInfo: {
    typeName: 'Attachment',
    typeNamePlural: 'Attachments',
    title: {type: #STANDARD, value: 'Filename'}
}

@Search.searchable: false

define view entity ZBO_DD_P_INV_ATTACH
  as projection on zbo_DD_INV_attach
{
      @UI.facet: [{
              position: 10,
              purpose: #STANDARD,
              type: #IDENTIFICATION_REFERENCE,
              label: 'Attachment Info',
              id: 'Attachments'
      }]
      @UI : {
            selectionField: [{position: 10 }],
            lineItem: [{position: 10 }],
            identification: [{position: 10 }]
      }
      key AttachmentId,
      @UI : {
            lineItem: [{position: 20 }],
            identification: [{position: 20 }]
      }
      Invoice,      
      @UI : {
            lineItem: [{position: 21 }],
            identification: [{position: 30 }]
      }
      @Search.defaultSearchElement: true
      Comments,      
      @UI : {
            lineItem: [{position: 40 }],
            identification: [{position: 40 }]
      }
      @Search.defaultSearchElement: true
      Attachment,
      @UI : {
            lineItem: [{position: 50 }],
            identification: [{position: 50 }]
      }
      @Search.defaultSearchElement: true
      Mimetype,
      @UI : {
            lineItem: [{position: 60 }],
            identification: [{position: 60 }]
      }
      @Search.defaultSearchElement: true
      Filename,
      LastChangedAt,
      
      /* Associations */
      _Invoice: redirected to parent ZBO_DD_P_INV_HEAD 
}
