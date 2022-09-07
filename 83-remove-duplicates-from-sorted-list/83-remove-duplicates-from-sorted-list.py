# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution:
    def __init__(self):
        self.uniques = []
        
    def deleteDuplicates(self, head: Optional[ListNode]) -> Optional[ListNode]:
        if head == None:
            return head
        
        self.uniques.append(head.val)
        
        if head.next != None:
            if ((head.next.val in self.uniques) & (head.next.next != None)):
                head.next = head.next.next
                self.deleteDuplicates(head)
            elif ((head.next.val in self.uniques) & (head.next.next == None)):
                head.next = None
                self.deleteDuplicates(head)
            else:
                self.uniques.append(head.next)
                self.deleteDuplicates(head.next)
        
        return head

                        
