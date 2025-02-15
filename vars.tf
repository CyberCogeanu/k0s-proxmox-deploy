#Set your public SSH key here
variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC55xS6fKrY8165Yc+7ZF+cWZFIyo+wIQs0U737VuAaPOuJMdiryGOiT3pLTW3q/SZhStJhIaeK8Rk/DyXtsM3B3Kk6DaIhog02khayGDmGlBJqnRMUZTSFxSSvftwKJmMKs65hah7VHxhRV1sicNn6maP6jPZ78+t5/mfx7IU1SIE1S0lvOOGdbMV8fbpQBtIEWmVZq0Csfq4+Y/AxC1cNbZY7dpIyIrw2XHKvehZc+zWVYCaYKbb8NVhffSS+qFJgMHoUqAzIkT4GznJ3/ZkdAmAuMR+zRIJozpsUTEuju06SPlxURdQWmUMY8l/UNSGy8gFFGENHtr9xF4kdGPoom76JaKIIZE5jzUQNuGwkkkv5PMRiN3bSaWbF+ok6SuwF4toa3c4ld+0js9YIkWvRl8Col0svlOLm3h8uHoJpYYr5MDAGOKZyxkz6iLtrY9x5m5zRhiZVPqtEXJTBbJb98mXhdt91tbDM1oxMui03vUEI2NikeksA09CvZ4I4fW/Tvcp0NfmOtRogT027d4I0z2dpt7gJbAY+nYC3eIGiyjxljEHmkhQaVSVfFCLyCpdR1XdSkRb4m8lR4opHqX+2UajEv/A/d5KWDlO8NS8Ok5gLofUMtsvx60+Yzz3zBUyCWsJWlAkSThmMvGUtvrgOMMYDFYmT7SZI73opgSEnbQ== elk@elk"
}
#Establish which Proxmox host you'd like to spin a VM up on
variable "proxmox_host" {
  default = "proxmox_host_name"
}
#Specify which template name you'd like to use
variable "template_name" {
  default = "ubuntu-2204-template"
}
#Establish which nic you would like to utilize
variable "nic_name" {
  default = "vmbr<number>"
}
#Establish the VLAN you'd like to use
variable "vlan_num" {
  default = "place_vlan_number_here"
}
#Provide the url of the host you would like the API to communicate on.
#It is safe to default to setting this as the URL for what you used
#as your `proxmox_host`, although they can be different
variable "api_url" {
  default = "https://192.168.0.2:8006/api2/json"
}
#Blank var for use by terraform.tfvars
variable "token_secret" {
}
#Blank var for use by terraform.tfvars
variable "token_id" {
}