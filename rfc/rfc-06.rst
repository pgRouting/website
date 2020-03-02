..
   ****************************************************************************
    pgRouting Website
    Copyright(c) pgRouting Contributors

    This documentation is licensed under a Creative Commons Attribution-Share
    Alike 3.0 License: https://creativecommons.org/licenses/by-sa/3.0/
   ****************************************************************************

.. _rfc-06:

RFC 06: [done] Implementation of "Bidirectional search" algorithm
===============================================================================

.. list-table::
   :widths: 15 85

   * - Date:
     - 2010/11/22
   * - Author:
     - Daniel Kastl
   * - Contact:
     - daniel at georepublic.de
   * - Last Edited:
     - 2013/06/09
   * - Status:
     - Implemented (v2.0.0)

Overview
********************************************************************************

Bidirectional search is a graph search algorithm that finds a shortest path from
an initial vertex to a goal vertex in a directed graph. It runs two simultaneous
searches: one forward from the initial state, and one backward from the goal,
stopping when the two meet in the middle. The reason for this approach is that
in many cases it is faster: for instance, in a simplified model of search
problem complexity in which both searches expand a tree with branching factor b,
and the distance from start to goal is d, each of the two searches has
complexity O(bd/2) (in Big O notation), and the sum of these two search times is
much less than the O(bd) complexity that would result from a single search from
the beginning to the goal.

[Source: https://en.wikipedia.org/wiki/Bidirectional_search]


Implementation Details
********************************************************************************

List of online resources:

* https://ideas.repec.org/p/dgr/eureir/1765016100.html
* https://en.wikibooks.org/wiki/Artificial_Intelligence/Search/Heuristic_search/Bidirectional_Search
* https://intelligence.worldofcomputing.net/ai-search/bidirectional-search.html


Backwards Compatibilty Issues
********************************************************************************

Are not expected


Documentation
********************************************************************************

Required.


Ticket ID
********************************************************************************

Not assigned.


Voting History
********************************************************************************

No vote yet.
