@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RAP BO for invoice objects'
define root view entity zbo_DD_INV_HEAD
  as select from zbo_t_inv_hdr
  composition [1..*] of zbo_DD_INV_attach as _Attachments
  association [1] to /DMO/I_Customer  as _Customer on
  $projection.VendorId = _Customer.CustomerID
{
  key zbo_t_inv_hdr.invoice               as Invoice,
      @EndUserText.label: 'Comments'
      zbo_t_inv_hdr.comments              as Comments,
      @EndUserText.label: 'Vendor Id'
      @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_CUSTOMER', element: 'CustomerID'} }]
      @ObjectModel.text.element: ['CustomerName']
      zbo_t_inv_hdr.vendor_id             as VendorId,
      _Customer.FirstName as CustomerName,
      @Semantics.user.createdBy: true
      zbo_t_inv_hdr.local_created_by      as LocalCreatedBy,
      @Semantics.user.lastChangedBy: true
      zbo_t_inv_hdr.local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      zbo_t_inv_hdr.local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      zbo_t_inv_hdr.last_changed_at as LastChangedAt,
      _Attachments,
      _Customer // Make association public
}
