#Problem

Design a data structure to represent a allowing or denying traffic by CIDR block and port range.  Describe this structure in the comments of your code.

Implement a function that takes a set of your structures and a target cloud platform and applies these rules to the network environment of that platform.  Please implement your solution for two of the following platforms: AWS, GCP, Azure, VMware, or Kubernetes.  

Please include answers to the following discussion questions as comments in your code:

How do you map the network rules to each platform i.e. how are the rules applied on each platform and to what types of resources on that platform?  
What are the differences between the platforms from a networking perspective? How does this impact your ability to create an abstraction across the platforms?
How fine grained do you provide control over network flow? How would you go about extending this for finer grain control?  Per instance? Per group? Per network?  
