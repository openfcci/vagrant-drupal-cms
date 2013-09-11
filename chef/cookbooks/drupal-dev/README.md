drupal-dev Cookbook
===================



Requirements
------------

#### OS
- `Ubuntu 12.04` - The cookbook has only been tested on Ubuntu 12.04

Attributes
----------
#### drupal-dev::default/drupal-dev::database
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['drupal']['db']['password']</tt></td>
    <td>String</td>
    <td>The password for accessing the drupal database</td>
    <td><tt>password</tt></td>
  </tr>
  <tr>
    <td><tt>['drupal']['prefix']</tt></td>
    <td>String</td>
    <td>The prefix to use for accessing the drupal sites.</td>
    <td><tt></tt></td>
  </tr>
</table>

Usage
-----
#### drupal-dev::default
Just include `drupal-dev` in your node's `run_list` and specifiy node['drupal']['prefix'].

License and Authors
-------------------
Authors: Brendan Tobolaski
