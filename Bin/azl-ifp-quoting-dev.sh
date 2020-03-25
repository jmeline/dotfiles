#!/bin/bash

. ~/bin/azl-reset.sh

export ARM_SUBSCRIPTION_ID=78dd0cb9-70cd-4cd5-8d3d-414581e421c9;
export ARM_CLIENT_ID=2794250d-2263-4785-ac9c-8737857088dc;
export ARM_CLIENT_SECRET=1cd7ca02-b3db-4ba3-afef-4f79f43a499f;
export ARM_TENANT_ID=76e3921f-489b-4b7e-9547-9ea297add9b5;
export ARM_ENVIRONMENT=public;

az login --service-principal --username 2794250d-2263-4785-ac9c-8737857088dc --password 1cd7ca02-b3db-4ba3-afef-4f79f43a499f --tenant 76e3921f-489b-4b7e-9547-9ea297add9b5
