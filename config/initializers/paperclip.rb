Paperclip::Attachment.default_options.merge!(
  storage: 's3',
  s3_credentials: {
    access_key_id: Settings.s3.access_key_id,
    secret_access_key: Settings.s3.secret_access_key
  },
  bucket: Settings.s3.bucket,
  url: ':s3_domain_url',
  path: ":class/:attachment/:id/:style.:extension"
)
