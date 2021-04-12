resource "google_bigquery_dataset" "dataset" {
  for_each = toset([
    "accredited_foreign_manufacturers",
    "corporate_numbers",
    "local_governments",
    "national_holidays",
    "number_of_births",
  ])
  dataset_id                      = each.key
  default_table_expiration_ms     = 5184000000
  default_partition_expiration_ms = 5184000000
  project                         = "jpdata"

  access {
    role          = "OWNER"
    special_group = "projectOwners"
  }
  access {
    role          = "WRITER"
    special_group = "projectWriters"
  }
  access {
    role          = "READER"
    special_group = "allAuthenticatedUsers"
  }
}
