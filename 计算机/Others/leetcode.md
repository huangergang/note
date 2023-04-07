两数之和 

``` java

public class Application {

    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode listNode;
        int carry = (l1.val + l2.val) / 10;
        int number = (l1.val + l2.val) % 10;
        listNode = new ListNode(number);
        ListNode list = listNode;
        l1 = l1.next;
        l2 = l2.next;
        while ((l1 != null) ||  (l2 != null)) {

            if ((l1 == null) && (l2 != null)) {
                number = (l2.val + carry) % 10;
                carry = (l2.val + carry) / 10;
                listNode.next = new ListNode(number);
                l2 = l2.next;
            }
            if ((l2 == null) && (l1 != null)) {
                number = (l1.val + carry) % 10;
                carry = (l1.val + carry) / 10;
                listNode.next = new ListNode(number);
                l1 = l1.next;
            }
            if ((l1 != null) && (l2 != null)) {
                number = (l1.val + l2.val + carry) % 10;
                carry = (l1.val + l2.val + carry) / 10;
                listNode.next = new ListNode(number);
                l1 = l1.next;
                l2 = l2.next;
            }
            listNode = listNode.next;
        }
        if (carry > 0) {
            listNode.next = new ListNode(1);
        }

        return list;
    }


    public void show(ListNode l1) {
        while (l1 != null) {
            System.out.print(l1.val);
            l1 = l1.next;
        }
    }

    public static void main(String[] args) {
        Application application = new Application();
//        ListNode l1 = new ListNode(9, new ListNode(9, new ListNode(9)));
//        ListNode l2 = new ListNode(5, new ListNode(6, new ListNode(4)));

        ListNode l1 = new ListNode(9, new ListNode(9, new ListNode(1)));
        ListNode l2 = new ListNode(1);
        ListNode l3 = application.addTwoNumbers(l1, l2);
        application.show(l3);
    }
}

class ListNode {
    int val;
    ListNode next;

    ListNode() {
    }

    ListNode(int val) {
        this.val = val;
    }

    ListNode(int val, ListNode next) {
        this.val = val;
        this.next = next;
    }
}
```

