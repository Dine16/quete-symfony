<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Site;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;

/**
 * Site controller.
 *
 * @Route("site")
 */
class SiteController extends Controller
{
    /**
     * Lists all site entities.
     *
     * @Route("/", name="site_index")
     * @Method("GET")
     * @return Response A Response instance
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $sites = $em->getRepository('AppBundle:Site')->findAll();

        return $this->render('site/index.html.twig', array(
            'sites' => $sites,
        ));
    }

    /**
     * Finds and displays a site entity.
     *
     * @param Site $site The Site Entity
     *
     * @Route("/{id}", name="site_show")
     * @Method("GET")
     * @return Response A Response instance
     */
    public function showAction(Site $site)
    {

        return $this->render('site/show.html.twig', array(
            'site' => $site,
        ));
    }
}
