provider "google" {
  project	= "firestore-multi-region-mtl"
}


resource "time_sleep" "wait_60_seconds" {
  create_duration = "60s"
}

resource "google_project_service" "firestore" {
  project 	= "firestore-multi-region-mtl"
  service 	= "firestore.googleapis.com"

  depends_on 	= [time_sleep.wait_60_seconds]
}

resource "google_firestore_database" "database" {
  project     			= "firestore-multi-region-mtl"
  name        			= "(default)"
  location_id 			= "nam5"
  type        			= "FIRESTORE_NATIVE"
  concurrency_mode		= "OPTIMISTIC"
  app_engine_integration_mode 	= "DISABLED"

  depends_on 			= [google_project_service.firestore]
}
