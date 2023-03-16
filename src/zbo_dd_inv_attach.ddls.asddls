@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoice attachments'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zbo_DD_INV_attach
  as select from zbo_t_inv_att
  association to parent zbo_DD_INV_HEAD as _Invoice on $projection.Invoice = _Invoice.Invoice
{
  key attachment_id as AttachmentId,
      @EndUserText.label: 'Invoice'
      invoice       as Invoice,
      @EndUserText.label: 'Comments'
      comments      as Comments,
      @EndUserText.label: 'Attachment'
      @Semantics.largeObject: {
        mimeType: 'Mimetype',
        fileName: 'Filename',
        contentDispositionPreference: #INLINE        
      }
      attachment    as Attachment,
      @EndUserText.label: 'Type of Document'
      mimetype      as Mimetype,
      @EndUserText.label: 'File Type'
      filename      as Filename,
      
      _Invoice.LastChangedAt as LastChangedAt,
      _Invoice
}
