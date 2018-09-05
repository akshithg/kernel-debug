/*
 * Sliced Kernel
 *
 */
#include <linux/kobject.h>
#include <linux/string.h>
#include <linux/sysfs.h>
#include <linux/module.h>
#include <linux/init.h>

static int app;
static int app_kernel;

static ssize_t app_show(struct kobject *kobj, struct kobj_attribute *attr,
                        char *buf)
{
    return sprintf(buf, "%d\n", app);
}

static ssize_t app_store(struct kobject *kobj, struct kobj_attribute *attr,
                         const char *buf, size_t count)
{
    int ret;

    ret = kstrtoint(buf, 10, &app);
    if (ret < 0)
        return ret;

    return count;
}

static ssize_t app_kernel_show(struct kobject *kobj, struct kobj_attribute *attr,
                        char *buf)
{
    return sprintf(buf, "%d\n", app_kernel);
}

static ssize_t app_kernel_store(struct kobject *kobj, struct kobj_attribute *attr,
                         const char *buf, size_t count)
{
    int ret;

    ret = kstrtoint(buf, 10, &app_kernel);
    if (ret < 0)
        return ret;

    return count;
}

/* Sysfs attributes cannot be world-writable. */
static struct kobj_attribute app_attribute =
    __ATTR(app, 0664, app_show, app_store);
static struct kobj_attribute app_kernel_attribute =
    __ATTR(app_kernel, 0664, app_kernel_show, app_kernel_store);


static struct attribute *attrs[] = {
    &app_attribute.attr,
    &app_kernel_attribute.attr,
    NULL, /* need to NULL terminate the list of attributes */
};

static struct attribute_group attr_group = {
    .attrs = attrs,
};

static struct kobject *sliced_kernel_kobj;

static int __init sliced_kernel_init(void)
{
    int retval;

    sliced_kernel_kobj = kobject_create_and_add("sliced_kernel", kernel_kobj);
    if (!sliced_kernel_kobj)
        return -ENOMEM;

    /* Create the files associated with this kobject */
    retval = sysfs_create_group(sliced_kernel_kobj, &attr_group);
    if (retval)
        kobject_put(sliced_kernel_kobj);

    return retval;
}

static void __exit sliced_kernel_exit(void)
{
    kobject_put(sliced_kernel_kobj);
}

module_init(sliced_kernel_init);
module_exit(sliced_kernel_exit);
MODULE_LICENSE("GPL v2");
MODULE_AUTHOR("G <gunaseka@oregonstate.edu>");
