variable "datasets" {
  type    = list(string)
}

resource "google_bigquery_dataset" "dataset" {
  for_each                        = toset(var.datasets)
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
