:Author: Daniel Kastl
:License: Creative Commons

.. _rfc-04:

================================================================================
RFC 04: [open] Implementation of "k-shortest path" algorithm
================================================================================

.. list-table::
   :widths: 15 85

   * - Date:
     - 2010/11/22
   * - Author:
     - Daniel Kastl
   * - Contact:
     - daniel at georepublic.de
   * - Last Edited:
     - 2010/11/22
   * - Status: 
     - Draft (xxxx/xx/xx)

Overview
----------------------------------------------

Yen’s algorithm is one of derivation algorithms for ranking the K shortest paths 
between a pair of nodes [1]. It always searches the shortest paths in a 
“pseudo”-tree containing K shortest loopless paths. The very shortest one is 
obtained in the first place, and the second shortest path is always explored on 
the basis of the shortest paths that are shorter. In our paper, we exploit the 
implementation of Yen’s algorithm in [1]. Compared with the straightforward 
implementation of Yen’s algorithm, the one present in [1] is proved to have a 
better performance in computational experiments, although the complexity of them 
are the same, O(Kn(m+nlogn)) in the worst case analysis.

[1] M. Pascoal and E. Martins. A new implementation of Yen’s ranking loopless 
paths algorithm. 4OR – Quarterly Journal of the Belgian, French and Italian 
Operations Research Societies, 2003.

[Source: http://code.google.com/p/k-shortest-paths/]


Implementation Details
----------------------------------------------

The source above provides an implementation of K-Shortest Path Algorithm written
in C++, available under Apache License 2.0

If possible adapt this implementation to make it available as pgRouting function.

	TBD


Usage Example
----------------------------------------------

	TBD


Further Considerations
----------------------------------------------

	TBD


Files Affected
----------------------------------------------

	TBD
	

Backwards Compatibilty Issues
----------------------------------------------

Are not expected


Documentation
----------------------------------------------

Required. 


Ticket ID
----------------------------------------------

Not assigned.


Voting History
----------------------------------------------

No vote yet.
